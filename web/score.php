<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

function rockserv_score_number($value): string {
    if ($value === null || $value === '') {
        return '0';
    }
    $number = (float)$value;
    if (abs($number - round($number)) < 0.001) {
        return (string)(int)round($number);
    }
    return number_format($number, 2);
}

function rockserv_score_stats(array $row): string {
    $stats = [
        'K' => (int)($row['KNO'] ?? 0),
        'M' => (int)($row['MAJ'] ?? 0),
        'C' => (int)($row['CHA'] ?? 0),
        'A' => (int)($row['AGI'] ?? 0),
        'S' => (int)($row['STR'] ?? 0),
        'D' => (int)($row['DEF'] ?? 0),
    ];
    $parts = [];
    foreach ($stats as $label => $value) {
        $parts[] = "{$label}:{$value}";
    }
    return implode(' ', $parts);
}

function rockserv_format_hours($minutes): string {
    $minutes = (int)($minutes ?? 0);
    $hours = $minutes / 60;
    return number_format($hours, 1);
}

function rockserv_format_date(?string $value): string {
    if ($value === null || $value === '' || strpos($value, '0000-00-00') === 0) {
        return 'Unknown';
    }
    return $value;
}

$player_name = trim((string)($_GET['player'] ?? ''));
$player_lower = strtolower($player_name);
$realm = rockserv_game();
$realm_label = rockserv_realm_label($realm);
$error = '';

$player = null;
$account = null;
$daily = [
    'days_tracked' => 0,
    'total_minutes' => 0,
    'week_minutes' => 0,
    'first_date' => null,
    'last_date' => null,
];
$log_summary = [];
$log_rows = [];
$command_counts = [];
$log_mode = $realm === 'fuzzem' ? 'command' : 'event';
$action_definitions = $log_mode === 'command'
    ? [
        ['label' => 'auction', 'commands' => ['auction']],
        ['label' => 'bank', 'commands' => ['bank']],
        ['label' => 'bid', 'commands' => ['bid']],
        ['label' => 'buy', 'commands' => ['buy']],
        ['label' => 'cast', 'commands' => ['cast']],
        ['label' => 'deposit', 'commands' => ['deposit']],
        ['label' => 'emote', 'commands' => ['emote']],
        ['label' => 'follow', 'commands' => ['follow']],
        ['label' => 'give', 'commands' => ['give']],
        ['label' => 'inventory', 'commands' => ['i']],
        ['label' => 'kill', 'commands' => ['a']],
        ['label' => 'leave', 'commands' => ['leave']],
        ['label' => 'raise', 'commands' => ['raise']],
        ['label' => 'remove', 'commands' => ['remove']],
        ['label' => 'say', 'commands' => ['say']],
        ['label' => 'score', 'commands' => ['score']],
        ['label' => 'shout', 'commands' => ['shout']],
        ['label' => 'skills', 'commands' => ['skills']],
        ['label' => 'stats', 'commands' => ['st']],
        ['label' => 'tell', 'commands' => ['tell']],
        ['label' => 'think', 'commands' => ['think']],
        ['label' => 'wear', 'commands' => ['wear']],
        ['label' => 'who', 'commands' => ['who']],
        ['label' => 'withdraw', 'commands' => ['withdraw']],
    ]
    : [];
$action_summary = [];

if ($player_name === '' || !preg_match('/^[A-Za-z0-9_]{3,20}$/', $player_name)) {
    $error = 'Player not found';
} else {
    try {
        $pdo = rockserv_pdo();
        $players_table = rockserv_players_table();
        $player_query_base = "SELECT NAME, LEV, RACE, KNO, MAJ, CHA, AGI, STR, DEF, WORTH, REPU";
        $player_query_pvp = "PVPKILLS, PVPDEATHS";
        $player_query_pve = "NPCKILLS, NPCDEATHS";
        $player_query_tail = "ARENA_PTS, DP, LAST_SAVED FROM {$players_table} WHERE LOWER(NAME) = ? LIMIT 1";
        $include_pve = true;
        $player = null;

        try {
            $stmt = $pdo->prepare(
                "{$player_query_base}, {$player_query_pvp}, {$player_query_pve}, {$player_query_tail}"
            );
            $stmt->execute([$player_lower]);
            $player = $stmt->fetch();
        } catch (Throwable $e) {
            $message = strtolower($e->getMessage());
            if (strpos($message, 'npckills') !== false || strpos($message, 'npcdeaths') !== false || strpos($message, 'column') !== false) {
                $include_pve = false;
                $stmt = $pdo->prepare(
                    "{$player_query_base}, {$player_query_pvp}, {$player_query_tail}"
                );
                $stmt->execute([$player_lower]);
                $player = $stmt->fetch();
            } else {
                throw $e;
            }
        }

        if (!$player) {
            $error = 'Player not found';
        } else {
            $account_table = rockserv_table();
            $stmt = $pdo->prepare(
                "SELECT id_member, member_name, userid_formatted
                 FROM {$account_table}
                 WHERE member_name = ?
                 LIMIT 1"
            );
            $stmt->execute([$player_lower]);
            $account = $stmt->fetch();

            if ($account) {
                $uin = (int)$account['id_member'];
                $daily_table = rockserv_daily_scores_table();
                $driver = $pdo->getAttribute(PDO::ATTR_DRIVER_NAME);
                $week_expr = $driver === 'pgsql'
                    ? "score_date >= CURRENT_DATE - INTERVAL '7 days'"
                    : "score_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)";

                $stmt = $pdo->prepare(
                    "SELECT COUNT(*) AS days_tracked,
                            COALESCE(SUM(min_online), 0) AS total_minutes,
                            COALESCE(SUM(CASE WHEN {$week_expr} THEN min_online ELSE 0 END), 0) AS week_minutes,
                            MIN(score_date) AS first_date,
                            MAX(score_date) AS last_date
                     FROM {$daily_table}
                     WHERE uin = ?"
                );
                $stmt->execute([$uin]);
                $daily = $stmt->fetch() ?: $daily;

                if ($log_mode === 'command') {
                    $action_table = rockserv_action_log_table();
                    if ($action_table !== '') {
                        $stmt = $pdo->prepare(
                            "SELECT command AS log_key, COUNT(*) AS total
                             FROM {$action_table}
                             WHERE uin = ?
                             GROUP BY command
                             ORDER BY total DESC, command ASC"
                        );
                        $stmt->execute([$uin]);
                        foreach ($stmt->fetchAll() as $row) {
                            $command_counts[$row['log_key']] = (int)$row['total'];
                        }
                    }
                } else {
                    $event_table = rockserv_event_log_table();
                    $stmt = $pdo->prepare(
                        "SELECT entry_type AS log_key, COUNT(*) AS total
                         FROM {$event_table}
                         WHERE uin_by = ?
                         GROUP BY entry_type
                         ORDER BY total DESC, entry_type ASC"
                    );
                    $stmt->execute([$uin]);
                    $log_summary = $stmt->fetchAll();

                    $stmt = $pdo->prepare(
                        "SELECT entry_type AS log_key, entry_desc AS log_desc, entry_date
                         FROM {$event_table}
                         WHERE uin_by = ?
                         ORDER BY entry_date DESC
                         LIMIT 20"
                    );
                    $stmt->execute([$uin]);
                    $log_rows = $stmt->fetchAll();
                }
            }
        }
    } catch (Throwable $e) {
        $error = 'Profile unavailable';
    }
}

if ($log_mode === 'command') {
    foreach ($action_definitions as $definition) {
        $count = 0;
        foreach ($definition['commands'] as $command) {
            $count += $command_counts[$command] ?? 0;
        }
        $action_summary[] = [
            'label' => $definition['label'],
            'total' => $count,
        ];
    }
}

rockserv_render_header('Rock: Crashed Plane Profile', 'Scoreboard Detail', false);
?>
      <main class="layout">
        <div class="stack">
          <section class="window">
            <div class="window-title">
              <span>Player Dossier</span>
              <span class="window-controls">[ _ ][ □ ][ × ]</span>
            </div>
            <div class="window-body">
              <p class="muted">Realm: <?php echo htmlspecialchars($realm_label, ENT_QUOTES); ?></p>
              <?php if ($error !== ''): ?>
                <div class="notice error"><?php echo htmlspecialchars($error, ENT_QUOTES); ?></div>
                <div class="button-row">
                  <a class="btn ghost" href="/scores.php?realm=<?php echo htmlspecialchars($realm, ENT_QUOTES); ?>">Back to scoreboard</a>
                </div>
              <?php else: ?>
                <?php
                  $race_label = rockserv_race_label($player['RACE'], $realm);
                  $stats = rockserv_score_stats($player);
                  $pve_kills = $include_pve ? (int)($player['NPCKILLS'] ?? 0) : 0;
                  $pve_deaths = $include_pve ? (int)($player['NPCDEATHS'] ?? 0) : 0;
                  $pve_ratio = $pve_deaths > 0 ? number_format($pve_kills / max(1, $pve_deaths), 2) : '0.00';
                  $pvp_kills = (int)($player['PVPKILLS'] ?? 0);
                  $pvp_deaths = (int)($player['PVPDEATHS'] ?? 0);
                  $pvp_ratio = $pvp_deaths > 0 ? number_format($pvp_kills / max(1, $pvp_deaths), 2) : '0.00';
                  $last_saved = rockserv_format_date($player['LAST_SAVED'] ?? null);
                  $account_name = $account['userid_formatted'] ?? $account['member_name'] ?? 'Unlinked';
                ?>
                <div class="grid-panels">
                  <div class="panel">
                    <h3>Core Stats</h3>
                    <ul class="list">
                      <li><span>Player</span><span><?php echo htmlspecialchars((string)$player['NAME'], ENT_QUOTES); ?></span></li>
                      <li><span>Race</span><span><?php echo htmlspecialchars($race_label, ENT_QUOTES); ?></span></li>
                      <li><span>Level</span><span><?php echo htmlspecialchars(rockserv_score_number($player['LEV']), ENT_QUOTES); ?></span></li>
                      <li><span>Stats</span><span class="score-stats"><?php echo htmlspecialchars($stats, ENT_QUOTES); ?></span></li>
                      <li><span>Cryl</span><span><?php echo htmlspecialchars(rockserv_score_number($player['WORTH']), ENT_QUOTES); ?></span></li>
                      <li><span>Reputation</span><span><?php echo htmlspecialchars(rockserv_score_number($player['REPU']), ENT_QUOTES); ?></span></li>
                    </ul>
                  </div>
                  <div class="panel">
                    <h3>Combat (PvE / PvP)</h3>
                    <ul class="list">
                      <li><span>PvE Kills</span><span><?php echo htmlspecialchars((string)$pve_kills, ENT_QUOTES); ?></span></li>
                      <li><span>PvE Deaths</span><span><?php echo htmlspecialchars((string)$pve_deaths, ENT_QUOTES); ?></span></li>
                      <li><span>PvE Ratio</span><span><?php echo htmlspecialchars($pve_ratio, ENT_QUOTES); ?></span></li>
                      <li><span>PvP Kills</span><span><?php echo htmlspecialchars((string)$pvp_kills, ENT_QUOTES); ?></span></li>
                      <li><span>PvP Deaths</span><span><?php echo htmlspecialchars((string)$pvp_deaths, ENT_QUOTES); ?></span></li>
                      <li><span>PvP Ratio</span><span><?php echo htmlspecialchars($pvp_ratio, ENT_QUOTES); ?></span></li>
                      <li><span>Arena Points</span><span><?php echo htmlspecialchars(rockserv_score_number($player['ARENA_PTS']), ENT_QUOTES); ?></span></li>
                      <li><span>DP</span><span><?php echo htmlspecialchars(rockserv_score_number($player['DP']), ENT_QUOTES); ?></span></li>
                    </ul>
                  </div>
                  <div class="panel">
                    <h3>Tracking</h3>
                    <ul class="list">
                      <li><span>Account</span><span><?php echo htmlspecialchars((string)$account_name, ENT_QUOTES); ?></span></li>
                      <li><span>Last Saved</span><span><?php echo htmlspecialchars($last_saved, ENT_QUOTES); ?></span></li>
                      <li><span>Days Tracked</span><span><?php echo htmlspecialchars((string)($daily['days_tracked'] ?? 0), ENT_QUOTES); ?></span></li>
                      <li><span>Hours Tracked</span><span><?php echo htmlspecialchars(rockserv_format_hours($daily['total_minutes'] ?? 0), ENT_QUOTES); ?></span></li>
                    </ul>
                  </div>
                </div>
                <div class="button-row">
                  <a class="btn ghost" href="/scores.php?realm=<?php echo htmlspecialchars($realm, ENT_QUOTES); ?>">Back to scoreboard</a>
                </div>
              <?php endif; ?>
            </div>
          </section>

          <?php if ($error === ''): ?>
          <section class="window">
            <div class="window-title">Activity Tracking</div>
            <div class="window-body">
              <p class="muted">Daily snapshots record time online and stat gains. Totals update when the realm writes daily scores.</p>
              <div class="stat-grid">
                <div class="stat-card">
                  <span>Hours Tracked</span>
                  <strong><?php echo htmlspecialchars(rockserv_format_hours($daily['total_minutes'] ?? 0), ENT_QUOTES); ?></strong>
                  <em>All time</em>
                </div>
                <div class="stat-card">
                  <span>Hours (7 days)</span>
                  <strong><?php echo htmlspecialchars(rockserv_format_hours($daily['week_minutes'] ?? 0), ENT_QUOTES); ?></strong>
                  <em>Last week</em>
                </div>
                <div class="stat-card">
                  <span>First Stat</span>
                  <strong><?php echo htmlspecialchars(rockserv_format_date($daily['first_date'] ?? null), ENT_QUOTES); ?></strong>
                  <em>Earliest snapshot</em>
                </div>
                <div class="stat-card">
                  <span>Last Stat</span>
                  <strong><?php echo htmlspecialchars(rockserv_format_date($daily['last_date'] ?? null), ENT_QUOTES); ?></strong>
                  <em>Most recent</em>
                </div>
              </div>
            </div>
          </section>

          <section class="window">
            <?php
              $log_title = $log_mode === 'command' ? 'Action Stats' : 'Action Log';
              $log_label = $log_mode === 'command' ? 'Command' : 'Type';
              $log_desc_label = $log_mode === 'command' ? 'Count' : 'Entry';
              $log_empty = 'No logged actions yet for this pilot.';
            ?>
            <div class="window-title"><?php echo htmlspecialchars($log_title, ENT_QUOTES); ?></div>
            <div class="window-body">
              <?php if ($log_mode === 'command'): ?>
                <?php if (!$account): ?>
                  <p class="muted">No account linked. Action logs are tied to account IDs.</p>
                <?php endif; ?>
                <div class="action-table">
                  <div class="action-row head">
                    <span><?php echo htmlspecialchars($log_label, ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars($log_desc_label, ENT_QUOTES); ?></span>
                  </div>
                  <?php foreach ($action_summary as $row): ?>
                    <div class="action-row">
                      <span><?php echo htmlspecialchars((string)$row['label'], ENT_QUOTES); ?></span>
                      <span><?php echo htmlspecialchars((string)$row['total'], ENT_QUOTES); ?></span>
                    </div>
                  <?php endforeach; ?>
                </div>
              <?php elseif (!$account): ?>
                <p class="muted">No account linked. Action logs are tied to account IDs.</p>
              <?php elseif (!$log_summary): ?>
                <p class="muted"><?php echo htmlspecialchars($log_empty, ENT_QUOTES); ?></p>
              <?php else: ?>
                <div class="log-list">
                  <div class="log-row head">
                    <span>Date</span>
                    <span><?php echo htmlspecialchars($log_label, ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars($log_desc_label, ENT_QUOTES); ?></span>
                  </div>
                  <?php if (!$log_rows): ?>
                    <div class="log-row">
                      <span>--</span>
                      <span>None</span>
                      <span>Waiting on realm events.</span>
                    </div>
                  <?php else: ?>
                    <?php foreach ($log_rows as $row): ?>
                      <?php $entry_date = rockserv_format_date($row['entry_date'] ?? null); ?>
                      <div class="log-row">
                        <span><?php echo htmlspecialchars($entry_date, ENT_QUOTES); ?></span>
                        <span><?php echo htmlspecialchars((string)$row['log_key'], ENT_QUOTES); ?></span>
                        <span><?php echo htmlspecialchars((string)($row['log_desc'] ?? ''), ENT_QUOTES); ?></span>
                      </div>
                    <?php endforeach; ?>
                  <?php endif; ?>
                </div>
              <?php endif; ?>
            </div>
          </section>
          <?php endif; ?>
        </div>
      </main>
<?php rockserv_render_footer(); ?>
