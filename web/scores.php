<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

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

$rows = [];
$error = '';
$realm = rockserv_game();
$realm_label = rockserv_realm_label($realm);
$telnet_port = rockserv_realm_telnet_port($realm);
try {
    $pdo = rockserv_pdo();
    $table = rockserv_players_table();
    $stmt = $pdo->prepare(
        "SELECT NAME, LEV, RACE, KNO, MAJ, CHA, AGI, STR, DEF, WORTH, REPU, PVPKILLS, PVPDEATHS, ARENA_PTS, DP
         FROM {$table}
         WHERE NAME IS NOT NULL
         ORDER BY LEV DESC, PVPKILLS DESC, REPU DESC
         LIMIT 25"
    );
    $stmt->execute();
    $rows = $stmt->fetchAll();
} catch (Throwable $e) {
    $error = 'Scoreboard unavailable';
}

rockserv_render_header('Rock: Crashed Plane Scoreboard', 'Scoreboard Uplink', false);
?>
      <main class="layout single">
        <section class="window main">
          <div class="window-title">
            <span>Hall of Echoes</span>
            <span class="window-controls">[ _ ][ □ ][ × ]</span>
          </div>
          <div class="window-body">
            <p class="muted">
              Showing <?php echo htmlspecialchars($realm_label, ENT_QUOTES); ?> standings. Connect via telnet port
              <?php echo htmlspecialchars((string)$telnet_port, ENT_QUOTES); ?>.
            </p>
            <p class="muted">Select a pilot to open the detail dossier and action log.</p>
            <?php if ($error !== ''): ?>
              <div class="notice error"><?php echo htmlspecialchars($error, ENT_QUOTES); ?></div>
            <?php elseif (!$rows): ?>
              <p class="muted">No scores yet. Be the first to climb the ladder.</p>
            <?php else: ?>
              <div class="scoreboard">
                <div class="score-row head">
                  <span>Rank</span>
                  <span>Player</span>
                  <span>Race</span>
                  <span>Level</span>
                  <span>Stats (K/M/C/A/S/D)</span>
                  <span>Cryl</span>
                  <span>Reputation</span>
                  <span>PvP K/D</span>
                  <span>Arena</span>
                  <span>DP</span>
                </div>
                <?php foreach ($rows as $index => $row): ?>
                  <?php
                    $race_label = rockserv_race_label($row['RACE'], $realm);
                    $stats = rockserv_score_stats($row);
                    $pvp_kills = (int)($row['PVPKILLS'] ?? 0);
                    $pvp_deaths = (int)($row['PVPDEATHS'] ?? 0);
                    $pvp = "{$pvp_kills}/{$pvp_deaths}";
                    $player_name = (string)$row['NAME'];
                    $detail_url = '/score.php?player=' . urlencode($player_name) . '&realm=' . urlencode($realm);
                  ?>
                  <div class="score-row">
                    <span><?php echo str_pad((string)($index + 1), 2, '0', STR_PAD_LEFT); ?></span>
                    <span><a href="<?php echo htmlspecialchars($detail_url, ENT_QUOTES); ?>"><?php echo htmlspecialchars($player_name, ENT_QUOTES); ?></a></span>
                    <span><?php echo htmlspecialchars($race_label, ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars((string)rockserv_score_number($row['LEV']), ENT_QUOTES); ?></span>
                    <span class="score-stats"><?php echo htmlspecialchars($stats, ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars(rockserv_score_number($row['WORTH']), ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars(rockserv_score_number($row['REPU']), ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars($pvp, ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars(rockserv_score_number($row['ARENA_PTS']), ENT_QUOTES); ?></span>
                    <span><?php echo htmlspecialchars(rockserv_score_number($row['DP']), ENT_QUOTES); ?></span>
                  </div>
                <?php endforeach; ?>
              </div>
            <?php endif; ?>
            <div class="button-row">
              <a class="btn ghost" href="/">Back home</a>
            </div>
          </div>
        </section>
      </main>
<?php rockserv_render_footer(); ?>
