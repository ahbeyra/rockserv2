<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

rockserv_require_login();
$user = rockserv_current_user();
$table = rockserv_table();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mode = $_POST['mode'] ?? '';

    try {
        $pdo = rockserv_pdo();

        if ($mode === 'email') {
            $email = trim($_POST['email'] ?? '');
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                rockserv_flash_set('Invalid email address', 'error');
            } else {
                $stmt = $pdo->prepare("UPDATE {$table} SET email = ? WHERE id_member = ?");
                $stmt->execute([$email, $user['id']]);
                $user['email'] = $email;
                rockserv_login_user($user);
                rockserv_flash_set('Email updated', 'success');
            }
        } elseif ($mode === 'password') {
            $current = (string)($_POST['current_password'] ?? '');
            $next = (string)($_POST['new_password'] ?? '');

            if (strlen($next) < 6) {
                rockserv_flash_set('New password too short', 'error');
            } else {
                $stmt = $pdo->prepare("SELECT passwd FROM {$table} WHERE id_member = ?");
                $stmt->execute([$user['id']]);
                $hash = (string)$stmt->fetchColumn();

                if (!rockserv_validate_password($current, $hash)) {
                    rockserv_flash_set('Current password incorrect', 'error');
                } else {
                    $stmt = $pdo->prepare("UPDATE {$table} SET passwd = ? WHERE id_member = ?");
                    $stmt->execute([rockserv_password_hash($next), $user['id']]);
                    rockserv_flash_set('Password updated', 'success');
                }
            }
        }
    } catch (Throwable $e) {
        rockserv_flash_set('Account update failed', 'error');
    }

    header('Location: /account.php');
    exit;
}

rockserv_render_header('Rock: Crashed Plane Account', 'Operator Console', false);
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span>Account Management</span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <?php rockserv_render_flash(); ?>
            <div class="account-grid">
              <div class="panel">
                <h3>Profile</h3>
                <ul class="list">
                  <li><span>Handle</span> <?php echo htmlspecialchars($user['display'], ENT_QUOTES); ?></li>
                  <li><span>Email</span> <?php echo htmlspecialchars($user['email'], ENT_QUOTES); ?></li>
                  <li><span>Realm</span> <?php echo htmlspecialchars(rockserv_realm_label(), ENT_QUOTES); ?></li>
                </ul>
              </div>
              <div class="panel">
                <h3>Update Email</h3>
                <form method="post" action="/account.php" class="form compact">
                  <input type="hidden" name="mode" value="email">
                  <label class="field">
                    <span>Email</span>
                    <input type="email" name="email" required value="<?php echo htmlspecialchars($user['email'], ENT_QUOTES); ?>">
                  </label>
                  <div class="button-row">
                    <button type="submit" class="btn primary">Save Email</button>
                  </div>
                </form>
              </div>
              <div class="panel">
                <h3>Change Password</h3>
                <form method="post" action="/account.php" class="form compact">
                  <input type="hidden" name="mode" value="password">
                  <label class="field">
                    <span>Current Password</span>
                    <input type="password" name="current_password" required>
                  </label>
                  <label class="field">
                    <span>New Password</span>
                    <input type="password" name="new_password" required minlength="6">
                  </label>
                  <div class="button-row">
                    <button type="submit" class="btn primary">Update Password</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
