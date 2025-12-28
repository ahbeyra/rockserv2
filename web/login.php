<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = (string)($_POST['password'] ?? '');

    if ($username === '' || $password === '') {
        rockserv_flash_set('Missing credentials', 'error');
        header('Location: /login.php');
        exit;
    }

    try {
        $pdo = rockserv_pdo();
        $table = rockserv_table();
        $stmt = $pdo->prepare(
            "SELECT id_member, member_name, userid_formatted, passwd, email
             FROM {$table} WHERE member_name = ?"
        );
        $stmt->execute([strtolower($username)]);
        $row = $stmt->fetch();

        if (!$row || !rockserv_validate_password($password, (string)$row['passwd'])) {
            rockserv_flash_set('Invalid username or password', 'error');
            header('Location: /login.php');
            exit;
        }

        rockserv_login_user([
            'id' => (int)$row['id_member'],
            'name' => (string)$row['member_name'],
            'display' => (string)($row['userid_formatted'] ?: $row['member_name']),
            'email' => (string)$row['email'],
        ]);

        rockserv_flash_set('Welcome back, ' . $row['userid_formatted'], 'success');
        header('Location: /account.php');
        exit;
    } catch (Throwable $e) {
        rockserv_flash_set('Login failed', 'error');
        header('Location: /login.php');
        exit;
    }
}

rockserv_render_header('Rock: Crashed Plane Login', 'Operator Access');
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span>Operator Login</span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <p class="muted">
              Access the <?php echo htmlspecialchars(rockserv_realm_label(), ENT_QUOTES); ?> operator console.
              Telnet port <?php echo htmlspecialchars((string)rockserv_realm_telnet_port(), ENT_QUOTES); ?>.
            </p>
            <?php rockserv_render_flash(); ?>
            <form method="post" action="/login.php" class="form">
              <label class="field">
                <span>Username</span>
                <input type="text" name="username" required autocomplete="username">
              </label>
              <label class="field">
                <span>Password</span>
                <input type="password" name="password" required autocomplete="current-password">
              </label>
              <div class="button-row">
                <button type="submit" class="btn primary">Access Console</button>
                <a class="btn ghost" href="/signup.php">Create account</a>
              </div>
            </form>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
