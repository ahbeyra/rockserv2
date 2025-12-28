<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

$rows = [];
$error = '';
$user = rockserv_current_user();

try {
    $pdo = rockserv_pdo();
    rockserv_ensure_forum_schema($pdo);
    $tables = rockserv_forum_tables();

    $stmt = $pdo->prepare(
        "SELECT c.id, c.slug, c.title, c.description,
                COUNT(t.id) AS thread_count,
                MAX(t.updated_at) AS last_update
         FROM {$tables['categories']} c
         LEFT JOIN {$tables['threads']} t ON t.category_id = c.id
         GROUP BY c.id, c.slug, c.title, c.description
         ORDER BY c.id"
    );
    $stmt->execute();
    $rows = $stmt->fetchAll();
} catch (Throwable $e) {
    $error = 'Forum unavailable';
}

rockserv_render_header('Rock: Crashed Plane Forum', 'Community Bulletin Board');
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span>Bulletin Board</span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <?php if ($error !== ''): ?>
              <div class="notice error"><?php echo htmlspecialchars($error, ENT_QUOTES); ?></div>
            <?php else: ?>
              <div class="forum-list">
                <div class="forum-row head">
                  <span>Channel</span>
                  <span>Threads</span>
                  <span>Last Update</span>
                </div>
                <?php foreach ($rows as $row): ?>
                  <div class="forum-row">
                    <div class="forum-title">
                      <a href="/category.php?id=<?php echo (int)$row['id']; ?>">
                        <?php echo htmlspecialchars($row['title'], ENT_QUOTES); ?>
                      </a>
                      <div class="muted"><?php echo htmlspecialchars($row['description'], ENT_QUOTES); ?></div>
                    </div>
                    <span><?php echo (int)$row['thread_count']; ?></span>
                    <span><?php echo $row['last_update'] ? htmlspecialchars((string)$row['last_update'], ENT_QUOTES) : '—'; ?></span>
                  </div>
                <?php endforeach; ?>
              </div>
              <?php if ($user): ?>
                <div class="button-row">
                  <a class="btn primary" href="/new_thread.php">Start New Thread</a>
                </div>
              <?php else: ?>
                <p class="muted">Log in to post a new thread.</p>
              <?php endif; ?>
            <?php endif; ?>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
