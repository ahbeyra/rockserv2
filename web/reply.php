<?php
declare(strict_types=1);
require_once __DIR__ . '/lib.php';

rockserv_require_login();
$user = rockserv_current_user();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: /forum.php');
    exit;
}

$thread_id = (int)($_POST['thread_id'] ?? 0);
$body = rockserv_clean_text((string)($_POST['body'] ?? ''), 4000);

if ($thread_id <= 0 || $body === '') {
    rockserv_flash_set('Reply cannot be empty', 'error');
    header('Location: /thread.php?id=' . $thread_id);
    exit;
}

try {
    $pdo = rockserv_pdo();
    rockserv_ensure_forum_schema($pdo);
    $tables = rockserv_forum_tables();
    $now = rockserv_now();

    $stmt = $pdo->prepare("SELECT id FROM {$tables['threads']} WHERE id = ?");
    $stmt->execute([$thread_id]);
    if (!$stmt->fetch()) {
        rockserv_flash_set('Thread not found', 'error');
        header('Location: /forum.php');
        exit;
    }

    $stmt = $pdo->prepare(
        "INSERT INTO {$tables['posts']} (thread_id, user_id, body, created_at)
         VALUES (?, ?, ?, ?)"
    );
    $stmt->execute([$thread_id, $user['id'], $body, $now]);

    $stmt = $pdo->prepare("UPDATE {$tables['threads']} SET updated_at = ? WHERE id = ?");
    $stmt->execute([$now, $thread_id]);

    rockserv_flash_set('Reply posted', 'success');
    header('Location: /thread.php?id=' . $thread_id);
    exit;
} catch (Throwable $e) {
    rockserv_flash_set('Reply failed', 'error');
    header('Location: /thread.php?id=' . $thread_id);
    exit;
}
