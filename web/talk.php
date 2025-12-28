<?php
declare(strict_types=1);
require_once __DIR__ . '/lib.php';

rockserv_session_start();
$user = rockserv_current_user();

try {
    $pdo = rockserv_pdo();
    rockserv_ensure_talk_schema($pdo);
} catch (Throwable $e) {
    $pdo = null;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $user && $pdo) {
    $message = (string)($_POST['message'] ?? '');
    $message = rockserv_filter_profanity(rockserv_clean_text($message, 240));
    $display = rockserv_clean_text((string)($user['display'] ?? $user['name'] ?? 'Operator'), 80);
    if ($message !== '') {
        $host = rockserv_env('ROCKSERV_TALKER_HOST', 'rockserv2_fuzzem');
        $port = (int)rockserv_env('ROCKSERV_TALKER_PORT', '2331');
        $sock = @fsockopen($host, $port, $errno, $errstr, 1);
        if ($sock) {
            $payload = sprintf("R2-CHANSND(0) %s %s\n", $display, $message);
            fwrite($sock, $payload);
            fclose($sock);
        }
    }
    header('Location: /talk.php');
    exit;
}

$messages = [];
$talker_ok = false;
if ($pdo) {
    $messages = rockserv_talk_messages($pdo, 40);
}

if (isset($_GET['poll'])) {
    header('Content-Type: application/json; charset=utf-8');
    $after = (int)($_GET['after'] ?? 0);
    $payload = [
        'ok' => false,
        'messages' => [],
        'last_id' => $after,
    ];
    if ($pdo) {
        $table = rockserv_talk_table();
        $realm = rockserv_game();
        $stmt = $pdo->prepare(
            "SELECT id, user_name, body, created_at
             FROM {$table}
             WHERE realm = ? AND id > ?
             ORDER BY id ASC
             LIMIT 50"
        );
        $stmt->execute([$realm, $after]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $payload['ok'] = true;
        $payload['messages'] = $rows;
        if (!empty($rows)) {
            $payload['last_id'] = (int)end($rows)['id'];
        }
    }
    echo json_encode($payload);
    exit;
}

$host = rockserv_env('ROCKSERV_TALKER_HOST', 'rockserv2_fuzzem');
$port = (int)rockserv_env('ROCKSERV_TALKER_PORT', '2331');
$sock = @fsockopen($host, $port, $errno, $errstr, 1);
if ($sock) {
    $talker_ok = true;
    fclose($sock);
}
?>
<!doctype html>
<html lang="en" class="talk-html">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Talkserv</title>
    <link rel="stylesheet" href="/styles.css">
  </head>
  <body class="talk-body">
    <div class="talk-panel" data-last-id="<?php echo htmlspecialchars((string)($messages[0]['id'] ?? 0), ENT_QUOTES); ?>">
      <div class="talk-status <?php echo $talker_ok ? 'ok' : 'down'; ?>">
        <?php echo $talker_ok ? 'Rock Chat: Connected' : 'Rock Chat: Offline'; ?>
      </div>
      <div class="talk-messages" aria-live="polite">
        <?php if (!$pdo): ?>
          <div class="talk-empty">Talkserv is offline.</div>
        <?php elseif (empty($messages)): ?>
          <div class="talk-empty">No chatter yet. Start the signal.</div>
        <?php else: ?>
          <?php foreach ($messages as $message): ?>
            <div class="talk-message">
              <div class="talk-meta">
                <span class="talk-user"><?php echo htmlspecialchars((string)$message['user_name'], ENT_QUOTES); ?></span>
                <span class="talk-time"><?php echo htmlspecialchars(date('H:i', strtotime((string)$message['created_at'])), ENT_QUOTES); ?></span>
              </div>
              <div class="talk-body-text"><?php echo htmlspecialchars((string)$message['body'], ENT_QUOTES); ?></div>
            </div>
          <?php endforeach; ?>
        <?php endif; ?>
      </div>

      <?php if ($user): ?>
        <form method="post" action="/talk.php" class="talk-form">
          <label class="talk-field">
            <span class="sr-only">Message</span>
            <input type="text" name="message" maxlength="240" placeholder="Transmit to talkserv" required>
          </label>
          <button type="submit" class="btn primary">Send</button>
        </form>
      <?php else: ?>
        <div class="talk-login">
          <span>Login required to transmit.</span>
          <a class="btn ghost" href="/login.php" target="_top">Login</a>
        </div>
      <?php endif; ?>
    </div>
    <script>
      const panel = document.querySelector('.talk-panel');
      const scroller = document.querySelector('.talk-messages');
      if (scroller) {
        scroller.scrollTop = scroller.scrollHeight;
      }

      const pollInterval = 3500;
      let lastId = panel ? Number(panel.dataset.lastId || '0') : 0;

      function formatTime(iso) {
        const date = new Date(iso.replace(' ', 'T'));
        if (Number.isNaN(date.getTime())) {
          return '';
        }
        return date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
      }

      function appendMessage(row) {
        if (!scroller) {
          return;
        }
        const wrapper = document.createElement('div');
        wrapper.className = 'talk-message';
        wrapper.innerHTML = `
          <div class="talk-meta">
            <span class="talk-user"></span>
            <span class="talk-time"></span>
          </div>
          <div class="talk-body-text"></div>
        `;
        wrapper.querySelector('.talk-user').textContent = row.user_name || 'Server';
        wrapper.querySelector('.talk-time').textContent = formatTime(row.created_at);
        wrapper.querySelector('.talk-body-text').textContent = row.body || '';
        scroller.appendChild(wrapper);
      }

      async function poll() {
        try {
          const response = await fetch(`/talk.php?poll=1&after=${lastId}`, { cache: 'no-store' });
          if (!response.ok) {
            return;
          }
          const data = await response.json();
          if (!data.ok) {
            return;
          }
          if (Array.isArray(data.messages) && data.messages.length) {
            const nearBottom = scroller
              ? scroller.scrollTop + scroller.clientHeight >= scroller.scrollHeight - 40
              : false;
            data.messages.forEach((row) => {
              appendMessage(row);
              lastId = Math.max(lastId, Number(row.id || 0));
            });
            if (scroller && nearBottom) {
              scroller.scrollTop = scroller.scrollHeight;
            }
          }
        } catch (err) {
          // ignore transient polling errors
        }
      }

      if (scroller) {
        setInterval(poll, pollInterval);
      }
    </script>
  </body>
</html>
