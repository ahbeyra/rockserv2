<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$thread = null;
$posts = [];
$error = '';
$user = rockserv_current_user();

try {
    $pdo = rockserv_pdo();
    rockserv_ensure_forum_schema($pdo);
    $tables = rockserv_forum_tables();
    $account_table = rockserv_table();

    $pdo->prepare("UPDATE {$tables['threads']} SET views = views + 1 WHERE id = ?")->execute([$id]);

    $stmt = $pdo->prepare(
        "SELECT t.id, t.title, t.created_at, t.updated_at, t.views, t.category_id,
                c.title AS category_title
         FROM {$tables['threads']} t
         JOIN {$tables['categories']} c ON c.id = t.category_id
         WHERE t.id = ?"
    );
    $stmt->execute([$id]);
    $thread = $stmt->fetch();

    if (!$thread) {
        $error = 'Thread not found';
    } else {
        $stmt = $pdo->prepare(
            "SELECT p.id, p.body, p.created_at, a.userid_formatted AS author
             FROM {$tables['posts']} p
             LEFT JOIN {$account_table} a ON a.id_member = p.user_id
             WHERE p.thread_id = ?
             ORDER BY p.created_at ASC"
        );
        $stmt->execute([$id]);
        $posts = $stmt->fetchAll();
    }
} catch (Throwable $e) {
    $error = 'Thread unavailable';
}

rockserv_render_header('Rock: Crashed Plane Forum', 'Thread Uplink');
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span><?php echo $thread ? htmlspecialchars((string)$thread['title'], ENT_QUOTES) : 'Thread'; ?></span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <?php rockserv_render_flash(); ?>
            <?php if ($error !== ''): ?>
              <div class="notice error"><?php echo htmlspecialchars($error, ENT_QUOTES); ?></div>
            <?php else: ?>
              <p class="muted">
                Channel: <a href="/category.php?id=<?php echo (int)$thread['category_id']; ?>">
                  <?php echo htmlspecialchars((string)$thread['category_title'], ENT_QUOTES); ?>
                </a>
                • Views: <?php echo (int)$thread['views']; ?>
              </p>
              <div class="posts">
                <?php foreach ($posts as $post): ?>
                  <article class="post">
                    <header>
                      <span class="post-author"><?php echo htmlspecialchars((string)$post['author'], ENT_QUOTES); ?></span>
                      <span class="post-time"><?php echo htmlspecialchars((string)$post['created_at'], ENT_QUOTES); ?></span>
                    </header>
                    <p><?php echo nl2br(htmlspecialchars((string)$post['body'], ENT_QUOTES)); ?></p>
                  </article>
                <?php endforeach; ?>
              </div>

              <?php if ($user): ?>
                <form method="post" action="/reply.php" class="form">
                  <input type="hidden" name="thread_id" value="<?php echo (int)$thread['id']; ?>">
                  <label class="field">
                    <span>Reply</span>
                    <textarea name="body" rows="4" required></textarea>
                  </label>
                  <div class="button-row">
                    <button type="submit" class="btn primary">Post Reply</button>
                    <a class="btn ghost" href="/category.php?id=<?php echo (int)$thread['category_id']; ?>">Back to channel</a>
                  </div>
                </form>
              <?php else: ?>
                <p class="muted">Log in to reply.</p>
                <div class="button-row">
                  <a class="btn ghost" href="/login.php">Login</a>
                </div>
              <?php endif; ?>
            <?php endif; ?>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
