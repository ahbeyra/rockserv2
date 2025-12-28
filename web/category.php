<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$category = null;
$threads = [];
$error = '';
$user = rockserv_current_user();

try {
    $pdo = rockserv_pdo();
    rockserv_ensure_forum_schema($pdo);
    $tables = rockserv_forum_tables();
    $account_table = rockserv_table();

    $stmt = $pdo->prepare("SELECT id, title, description FROM {$tables['categories']} WHERE id = ?");
    $stmt->execute([$id]);
    $category = $stmt->fetch();

    if (!$category) {
        $error = 'Channel not found';
    } else {
        $stmt = $pdo->prepare(
            "SELECT t.id, t.title, t.created_at, t.updated_at, t.views,
                    COUNT(p.id) - 1 AS replies,
                    a.userid_formatted AS author
             FROM {$tables['threads']} t
             LEFT JOIN {$tables['posts']} p ON p.thread_id = t.id
             LEFT JOIN {$account_table} a ON a.id_member = t.user_id
             WHERE t.category_id = ?
             GROUP BY t.id, t.title, t.created_at, t.updated_at, t.views, a.userid_formatted
             ORDER BY t.updated_at DESC"
        );
        $stmt->execute([$id]);
        $threads = $stmt->fetchAll();
    }
} catch (Throwable $e) {
    $error = 'Forum unavailable';
}

rockserv_render_header('Rock: Crashed Plane Forum', 'Channel Threads');
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span><?php echo $category ? htmlspecialchars((string)$category['title'], ENT_QUOTES) : 'Channel'; ?></span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <?php if ($error !== ''): ?>
              <div class="notice error"><?php echo htmlspecialchars($error, ENT_QUOTES); ?></div>
            <?php else: ?>
              <p class="muted"><?php echo htmlspecialchars((string)$category['description'], ENT_QUOTES); ?></p>
              <div class="forum-list">
                <div class="forum-row head threads">
                  <span>Thread</span>
                  <span>Author</span>
                  <span>Replies</span>
                  <span>Updated</span>
                </div>
                <?php foreach ($threads as $thread): ?>
                  <div class="forum-row threads">
                    <div class="forum-title">
                      <a href="/thread.php?id=<?php echo (int)$thread['id']; ?>">
                        <?php echo htmlspecialchars((string)$thread['title'], ENT_QUOTES); ?>
                      </a>
                      <div class="muted">Views: <?php echo (int)$thread['views']; ?></div>
                    </div>
                    <span><?php echo htmlspecialchars((string)$thread['author'], ENT_QUOTES); ?></span>
                    <span><?php echo (int)$thread['replies']; ?></span>
                    <span><?php echo htmlspecialchars((string)$thread['updated_at'], ENT_QUOTES); ?></span>
                  </div>
                <?php endforeach; ?>
              </div>
              <div class="button-row">
                <?php if ($user): ?>
                  <a class="btn primary" href="/new_thread.php?category=<?php echo (int)$category['id']; ?>">Start Thread</a>
                <?php else: ?>
                  <a class="btn ghost" href="/login.php">Login to Post</a>
                <?php endif; ?>
                <a class="btn ghost" href="/forum.php">Back to channels</a>
              </div>
            <?php endif; ?>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
