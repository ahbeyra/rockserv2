<?php
declare(strict_types=1);

function rockserv_env(string $key, string $default = ''): string {
    $value = getenv($key);
    if ($value === false || $value === '') {
        return $default;
    }
    return $value;
}

function rockserv_allowed_realms(): array {
    return [
        'dillfrog' => 'Dillfrog',
        'fuzzem' => 'Fuzzem',
    ];
}

function rockserv_sanitize_realm(?string $realm): ?string {
    if ($realm === null) {
        return null;
    }
    $realm = strtolower(trim($realm));
    return array_key_exists($realm, rockserv_allowed_realms()) ? $realm : null;
}

function rockserv_set_realm_from_request(): void {
    $requested = rockserv_sanitize_realm($_GET['realm'] ?? null);
    if ($requested === null) {
        return;
    }
    rockserv_session_start();
    if (isset($_SESSION['user']) && ($_SESSION['user']['realm'] ?? '') !== $requested) {
        unset($_SESSION['user']);
    }
    $_SESSION['realm'] = $requested;
}

function rockserv_game(): string {
    rockserv_set_realm_from_request();
    rockserv_session_start();
    $realm = rockserv_sanitize_realm($_SESSION['realm'] ?? null);
    if ($realm !== null) {
        return $realm;
    }
    $game = rockserv_env('ROCKSERV_GAME', 'fuzzem');
    return $game === 'fuzzem' ? 'fuzzem' : 'dillfrog';
}

function rockserv_realm_label(?string $realm = null): string {
    $realm = $realm ?? rockserv_game();
    $realms = rockserv_allowed_realms();
    return $realms[$realm] ?? ucfirst($realm);
}

function rockserv_realm_ports(): array {
    return [
        'dillfrog' => [
            'telnet' => 4000,
        ],
        'fuzzem' => [
            'telnet' => 4040,
        ],
    ];
}

function rockserv_realm_telnet_port(?string $realm = null): int {
    $realm = $realm ?? rockserv_game();
    $ports = rockserv_realm_ports();
    return (int)($ports[$realm]['telnet'] ?? 4000);
}

function rockserv_realm_url(string $realm): string {
    $realm = rockserv_sanitize_realm($realm) ?? rockserv_game();
    $request = $_SERVER['REQUEST_URI'] ?? '/';
    $parts = parse_url($request);
    $path = $parts['path'] ?? '/';
    $query = [];
    if (!empty($parts['query'])) {
        parse_str($parts['query'], $query);
    }
    $query['realm'] = $realm;
    $query_string = http_build_query($query);
    return $query_string === '' ? $path : "{$path}?{$query_string}";
}

function rockserv_db_name(): string {
    $name = rockserv_env('ROCKSERV_DB_NAME', '');
    if ($name !== '') {
        return $name;
    }
    return rockserv_game() === 'dillfrog' ? 'r2_dillfrog' : 'r2_fuzzem';
}

function rockserv_table(): string {
    return rockserv_game() === 'dillfrog' ? 'accounts' : 'r2_members';
}

function rockserv_players_table(): string {
    return rockserv_game() === 'dillfrog' ? 'players' : 'r2_players';
}

function rockserv_daily_scores_table(): string {
    return rockserv_game() === 'dillfrog' ? 'daily_scores' : 'r2_daily_scores';
}

function rockserv_event_log_table(): string {
    return rockserv_game() === 'dillfrog' ? 'event_log' : 'r2_event_log';
}

function rockserv_action_log_table(): string {
    return rockserv_game() === 'fuzzem' ? 'r2_action_log' : '';
}

function rockserv_races_for_realm(?string $realm = null): array {
    $realm = $realm ?? rockserv_game();
    if ($realm === 'fuzzem') {
        return [
            'Outcast',
            'Vrean',
            'Spectrite',
            'Dryne',
            'Taer',
            'Shi-Kul',
            'Kelion',
            '7',
            '8',
            '9',
            '10',
            '10',
            '11',
            '12',
            'TEAM A',
            'TEAM B',
        ];
    }

    return [
        'Outcast',
        'Vrean',
        'Spectrite',
        'Dryne',
        'Taer',
        'Shi-Kul',
        'TEAM A',
        'TEAM B',
        'Ecurte',
    ];
}

function rockserv_race_label($race, ?string $realm = null): string {
    if ($race === null || $race === '') {
        return 'Unlisted';
    }
    $realm = $realm ?? rockserv_game();
    $races = rockserv_races_for_realm($realm);
    $index = (int)$race;
    return $races[$index] ?? "Race {$index}";
}

function rockserv_dsn(): string {
    $driver = strtolower(rockserv_env('ROCKSERV_DB_DRIVER', 'mariadb'));
    $host = rockserv_env('ROCKSERV_DB_HOST', 'db');
    $port = rockserv_env('ROCKSERV_DB_PORT', '');
    $db_name = rockserv_db_name();

    if (in_array($driver, ['pg', 'postgres', 'postgresql'], true)) {
        $dsn = "pgsql:host={$host};dbname={$db_name}";
        if ($port !== '') {
            $dsn .= ";port={$port}";
        }
        return $dsn;
    }

    $dsn = "mysql:host={$host};dbname={$db_name};charset=utf8mb4";
    if ($port !== '') {
        $dsn .= ";port={$port}";
    }
    return $dsn;
}

function rockserv_pdo(): PDO {
    $dsn = rockserv_dsn();
    $user = rockserv_env('ROCKSERV_DB_USER', 'rockserv');
    $pass = rockserv_env('ROCKSERV_DB_PASS', 'change_me');

    return new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);
}

function rockserv_session_start(): void {
    if (session_status() !== PHP_SESSION_NONE) {
        return;
    }
    if (headers_sent()) {
        return;
    }
    $save_path = rockserv_env('ROCKSERV_SESSION_PATH', '');
    if ($save_path !== '') {
        if (!is_dir($save_path)) {
            @mkdir($save_path, 0777, true);
        }
        if (!is_writable($save_path)) {
            $save_path = sys_get_temp_dir();
        }
        @session_save_path($save_path);
    }
    @session_start();
}

function rockserv_flash_set(string $message, string $type = 'info'): void {
    rockserv_session_start();
    $_SESSION['flash'] = [
        'message' => $message,
        'type' => $type,
    ];
}

function rockserv_flash_get(): ?array {
    rockserv_session_start();
    if (!isset($_SESSION['flash'])) {
        return null;
    }
    $flash = $_SESSION['flash'];
    unset($_SESSION['flash']);
    return $flash;
}

function rockserv_current_user(): ?array {
    rockserv_session_start();
    if (!isset($_SESSION['user'])) {
        return null;
    }
    $user = $_SESSION['user'];
    $realm = $user['realm'] ?? null;
    if ($realm !== null && $realm !== rockserv_game()) {
        unset($_SESSION['user']);
        return null;
    }
    return $user;
}

function rockserv_require_login(string $redirect = '/login.php'): void {
    if (rockserv_current_user() === null) {
        header('Location: ' . $redirect);
        exit;
    }
}

function rockserv_login_user(array $user): void {
    rockserv_session_start();
    $user['realm'] = rockserv_game();
    $_SESSION['user'] = $user;
}

function rockserv_logout_user(): void {
    rockserv_session_start();
    unset($_SESSION['user']);
}

function rockserv_password_hash(string $password): string {
    return md5($password);
}

function rockserv_validate_password(string $password, string $hash): bool {
    return hash_equals($hash, rockserv_password_hash($password));
}

function rockserv_forum_tables(): array {
    return [
        'categories' => 'forum_categories',
        'threads' => 'forum_threads',
        'posts' => 'forum_posts',
    ];
}

function rockserv_talk_table(): string {
    return 'talk_messages';
}

function rockserv_ensure_forum_schema(PDO $pdo): void {
    $driver = $pdo->getAttribute(PDO::ATTR_DRIVER_NAME);
    $tables = rockserv_forum_tables();
    $now = rockserv_now();

    if ($driver === 'pgsql') {
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$tables['categories']} (
                id SERIAL PRIMARY KEY,
                slug VARCHAR(64) NOT NULL UNIQUE,
                title VARCHAR(100) NOT NULL,
                description VARCHAR(255) NOT NULL,
                created_at TIMESTAMP NOT NULL
            )"
        );
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$tables['threads']} (
                id SERIAL PRIMARY KEY,
                category_id INT NOT NULL,
                user_id INT NOT NULL,
                title VARCHAR(150) NOT NULL,
                created_at TIMESTAMP NOT NULL,
                updated_at TIMESTAMP NOT NULL,
                views INT NOT NULL DEFAULT 0
            )"
        );
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$tables['posts']} (
                id SERIAL PRIMARY KEY,
                thread_id INT NOT NULL,
                user_id INT NOT NULL,
                body TEXT NOT NULL,
                created_at TIMESTAMP NOT NULL
            )"
        );
    } else {
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$tables['categories']} (
                id INT AUTO_INCREMENT PRIMARY KEY,
                slug VARCHAR(64) NOT NULL UNIQUE,
                title VARCHAR(100) NOT NULL,
                description VARCHAR(255) NOT NULL,
                created_at DATETIME NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4"
        );
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$tables['threads']} (
                id INT AUTO_INCREMENT PRIMARY KEY,
                category_id INT NOT NULL,
                user_id INT NOT NULL,
                title VARCHAR(150) NOT NULL,
                created_at DATETIME NOT NULL,
                updated_at DATETIME NOT NULL,
                views INT NOT NULL DEFAULT 0
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4"
        );
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$tables['posts']} (
                id INT AUTO_INCREMENT PRIMARY KEY,
                thread_id INT NOT NULL,
                user_id INT NOT NULL,
                body TEXT NOT NULL,
                created_at DATETIME NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4"
        );
    }

    $stmt = $pdo->query("SELECT COUNT(*) FROM {$tables['categories']}");
    $count = (int)$stmt->fetchColumn();
    if ($count === 0) {
        $seed = [
            ['general', 'General Transmission', 'Announcements, server status, and community news.'],
            ['strategy', 'Strategy & Guides', 'Build advice, quests, and tactics.'],
            ['trade', 'Trade Network', 'Items, crafting, and player markets.'],
            ['offtopic', 'Off-Topic', 'Everything else, within reason.'],
        ];
        $insert = $pdo->prepare(
            "INSERT INTO {$tables['categories']} (slug, title, description, created_at)
             VALUES (?, ?, ?, ?)"
        );
        foreach ($seed as $row) {
            $insert->execute([$row[0], $row[1], $row[2], $now]);
        }
    }
}

function rockserv_ensure_talk_schema(PDO $pdo): void {
    $driver = $pdo->getAttribute(PDO::ATTR_DRIVER_NAME);
    $table = rockserv_talk_table();

    if ($driver === 'pgsql') {
        $pdo->exec(
            "CREATE TABLE IF NOT EXISTS {$table} (
                id SERIAL PRIMARY KEY,
                realm VARCHAR(16) NOT NULL,
                user_id INT NOT NULL,
                user_name VARCHAR(80) NOT NULL,
                body TEXT NOT NULL,
                created_at TIMESTAMP NOT NULL
            )"
        );
        return;
    }

    $pdo->exec(
        "CREATE TABLE IF NOT EXISTS {$table} (
            id INT AUTO_INCREMENT PRIMARY KEY,
            realm VARCHAR(16) NOT NULL,
            user_id INT NOT NULL,
            user_name VARCHAR(80) NOT NULL,
            body TEXT NOT NULL,
            created_at DATETIME NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4"
    );
}

function rockserv_now(): string {
    return date('Y-m-d H:i:s');
}

function rockserv_clean_text(string $value, int $max): string {
    $value = trim($value);
    $value = preg_replace('/[\r\n]+/', ' ', $value);
    $value = preg_replace('/\\\\[rn]/', ' ', $value);
    $value = preg_replace('/\s{2,}/', ' ', $value);
    if (strlen($value) > $max) {
        $value = substr($value, 0, $max);
    }
    return $value;
}

function rockserv_filter_profanity(string $value): string {
    $bad_words = [
        'asshole',
        'bastard',
        'bitch',
        'bullshit',
        'cunt',
        'dick',
        'fuck',
        'motherfucker',
        'piss',
        'shit',
        'slut',
    ];

    foreach ($bad_words as $word) {
        $pattern = '/\b' . preg_quote($word, '/') . '\b/i';
        $replacement = str_repeat('*', strlen($word));
        $value = preg_replace($pattern, $replacement, $value);
    }

    return $value;
}

function rockserv_talk_messages(PDO $pdo, int $limit = 40): array {
    $table = rockserv_talk_table();
    $realm = rockserv_game();
    $limit = max(1, min(200, $limit));

    $stmt = $pdo->prepare(
        "SELECT id, user_name, body, created_at
         FROM {$table}
         WHERE realm = ?
         ORDER BY id DESC
         LIMIT {$limit}"
    );
    $stmt->execute([$realm]);
    $rows = $stmt->fetchAll();
    return array_reverse($rows);
}

function rockserv_ensure_special_event_schema(PDO $pdo): void {
    $table = rockserv_db_name() . '.special_events';
    $pdo->exec(
        "CREATE TABLE IF NOT EXISTS {$table} (
            realm VARCHAR(16) NOT NULL,
            key_name VARCHAR(32) NOT NULL,
            label VARCHAR(80) NOT NULL,
            description VARCHAR(255) NOT NULL,
            active INT NOT NULL,
            updated_at TIMESTAMP NOT NULL,
            PRIMARY KEY (realm, key_name)
        )"
    );
    try {
        $pdo->exec("ALTER TABLE {$table} ADD COLUMN description VARCHAR(255) NOT NULL DEFAULT ''");
    } catch (Throwable $e) {
        // Column already exists or cannot be altered; ignore for now.
    }
}

function rockserv_active_special_event(PDO $pdo): ?array {
    rockserv_ensure_special_event_schema($pdo);
    $table = rockserv_db_name() . '.special_events';
    $realm = rockserv_game();
    $stmt = $pdo->prepare(
        "SELECT key_name, label, description, updated_at
         FROM {$table}
         WHERE realm = ? AND active = 1
         ORDER BY updated_at DESC
         LIMIT 1"
    );
    $stmt->execute([$realm]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    return $row ?: null;
}

function rockserv_add_talk_message(PDO $pdo, array $user, string $body): void {
    $table = rockserv_talk_table();
    $realm = rockserv_game();
    $user_id = (int)($user['id'] ?? 0);
    $user_name = rockserv_clean_text((string)($user['display'] ?? $user['name'] ?? 'Operator'), 80);

    $body = preg_replace('/\s+/', ' ', $body);
    $body = rockserv_filter_profanity(rockserv_clean_text($body, 240));
    if ($body === '') {
        return;
    }

    $stmt = $pdo->prepare(
        "INSERT INTO {$table} (realm, user_id, user_name, body, created_at)
         VALUES (?, ?, ?, ?, ?)"
    );
    $stmt->execute([$realm, $user_id, $user_name, $body, rockserv_now()]);
}

function rockserv_insert_thread(PDO $pdo, int $category_id, int $user_id, string $title, string $now): int {
    $tables = rockserv_forum_tables();
    $driver = $pdo->getAttribute(PDO::ATTR_DRIVER_NAME);

    if ($driver === 'pgsql') {
        $stmt = $pdo->prepare(
            "INSERT INTO {$tables['threads']} (category_id, user_id, title, created_at, updated_at)
             VALUES (?, ?, ?, ?, ?) RETURNING id"
        );
        $stmt->execute([$category_id, $user_id, $title, $now, $now]);
        return (int)$stmt->fetchColumn();
    }

    $stmt = $pdo->prepare(
        "INSERT INTO {$tables['threads']} (category_id, user_id, title, created_at, updated_at)
         VALUES (?, ?, ?, ?, ?)"
    );
    $stmt->execute([$category_id, $user_id, $title, $now, $now]);
    return (int)$pdo->lastInsertId();
}

rockserv_session_start();
