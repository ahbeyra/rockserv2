<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

rockserv_require_login();
$user = rockserv_current_user();
$categories = [];
$error = '';
$selected_id = isset($_GET['category']) ? (int)$_GET['category'] : 0;

try {
    $pdo = rockserv_pdo();
    rockserv_ensure_forum_schema($pdo);
    $tables = rockserv_forum_tables();

    $stmt = $pdo->query("SELECT id, title FROM {$tables['categories']} ORDER BY id");
    $categories = $stmt->fetchAll();

    if ($selected_id === 0 && $categories) {
        $selected_id = (int)$categories[0]['id'];
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $category_id = (int)($_POST['category_id'] ?? 0);
        $title = rockserv_clean_text((string)($_POST['title'] ?? ''), 150);
        $body = rockserv_clean_text((string)($_POST['body'] ?? ''), 4000);

        if ($category_id <= 0 || $title === '' || $body === '') {
            rockserv_flash_set('Title and message are required', 'error');
            header('Location: /new_thread.php?category=' . $category_id);
            exit;
        }

        $now = rockserv_now();
        $thread_id = rockserv_insert_thread($pdo, $category_id, $user['id'], $title, $now);

        $stmt = $pdo->prepare(
            "INSERT INTO {$tables['posts']} (thread_id, user_id, body, created_at)
             VALUES (?, ?, ?, ?)"
        );
        $stmt->execute([$thread_id, $user['id'], $body, $now]);

        rockserv_flash_set('Thread created', 'success');
        header('Location: /thread.php?id=' . $thread_id);
        exit;
    }
} catch (Throwable $e) {
    $error = 'Forum unavailable';
}

rockserv_render_header('Rock: Crashed Plane Forum', 'New Transmission');
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span>Start New Thread</span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <?php if ($error !== ''): ?>
              <div class="notice error"><?php echo htmlspecialchars($error, ENT_QUOTES); ?></div>
            <?php else: ?>
              <?php rockserv_render_flash(); ?>
              <form method="post" action="/new_thread.php?category=<?php echo (int)$selected_id; ?>" class="form">
                <label class="field">
                  <span>Channel</span>
                  <select name="category_id">
                    <?php foreach ($categories as $category): ?>
                      <option value="<?php echo (int)$category['id']; ?>" <?php echo (int)$category['id'] === $selected_id ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars((string)$category['title'], ENT_QUOTES); ?>
                      </option>
                    <?php endforeach; ?>
                  </select>
                </label>
                <label class="field">
                  <span>Thread Title</span>
                  <input type="text" name="title" required maxlength="150">
                </label>
                <label class="field">
                  <span>Message</span>
                  <textarea name="body" rows="6" required></textarea>
                </label>
                <div class="button-row">
                  <button type="submit" class="btn primary">Broadcast Thread</button>
                  <a class="btn ghost" href="/forum.php">Cancel</a>
                </div>
              </form>
            <?php endif; ?>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
