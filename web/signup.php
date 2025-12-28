<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = (string)($_POST['password'] ?? '');

    if (!preg_match('/^[A-Za-z0-9_]{3,20}$/', $username)) {
        rockserv_flash_set('Invalid username', 'error');
        header('Location: /signup.php');
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        rockserv_flash_set('Invalid email address', 'error');
        header('Location: /signup.php');
        exit;
    }

    if (strlen($password) < 6) {
        rockserv_flash_set('Password too short', 'error');
        header('Location: /signup.php');
        exit;
    }

    $table = rockserv_table();
    $user_lower = strtolower($username);

    try {
        $pdo = rockserv_pdo();
        $pdo->beginTransaction();

        $stmt = $pdo->prepare("SELECT id_member FROM {$table} WHERE member_name = ?");
        $stmt->execute([$user_lower]);
        if ($stmt->fetch()) {
            $pdo->rollBack();
            rockserv_flash_set('Username already exists', 'error');
            header('Location: /signup.php');
            exit;
        }

        $stmt = $pdo->query("SELECT COALESCE(MAX(id_member), 0) + 1 AS next_id FROM {$table}");
        $next_id = (int)$stmt->fetchColumn();

        $stmt = $pdo->prepare(
            "INSERT INTO {$table} (id_member, member_name, email, passwd, active, userid_formatted, prefer_censor, gender)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        );
        $stmt->execute([
            $next_id,
            $user_lower,
            $email,
            rockserv_password_hash($password),
            '1',
            $username,
            '0',
            'N',
        ]);

        $pdo->commit();
        rockserv_flash_set('Account created. You can log in now.', 'success');
        header('Location: /login.php');
        exit;
    } catch (Throwable $e) {
        if (isset($pdo) && $pdo->inTransaction()) {
            $pdo->rollBack();
        }
        rockserv_flash_set('Signup failed', 'error');
        header('Location: /signup.php');
        exit;
    }
}

rockserv_render_header('Rock: Crashed Plane Signup', 'Account Terminal');
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span>Account Terminal</span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <p class="muted">
              Create a new account for <?php echo htmlspecialchars(rockserv_realm_label(), ENT_QUOTES); ?>.
              Telnet port <?php echo htmlspecialchars((string)rockserv_realm_telnet_port(), ENT_QUOTES); ?>.
            </p>
            <?php rockserv_render_flash(); ?>
            <form method="post" action="/signup.php" class="form">
              <label class="field">
                <span>Username</span>
                <input type="text" name="username" required minlength="3" maxlength="20" autocomplete="username">
              </label>
              <label class="field">
                <span>Email</span>
                <input type="email" name="email" required autocomplete="email">
              </label>
              <label class="field">
                <span>Password</span>
                <input type="password" name="password" required minlength="6" autocomplete="new-password">
              </label>
              <div class="button-row">
                <button type="submit" class="btn primary">Create Account</button>
                <a class="btn ghost" href="/login.php">Already registered</a>
              </div>
            </form>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
