<?php
declare(strict_types=1);
require_once __DIR__ . '/partials.php';

rockserv_render_header('Rock: Crashed Plane', 'Crashed Plane Access Grid');

$special_event = null;
try {
    $pdo = rockserv_pdo();
    $special_event = rockserv_active_special_event($pdo);
} catch (Throwable $e) {
    $special_event = null;
}
?>
      <main class="layout">
        <div class="stack">
          <section class="window">
            <div class="window-title">
              <span>Mission Briefing</span>
              <span class="window-controls">[ _ ][ □ ][ × ]</span>
            </div>
            <div class="window-body">
              <h1 class="hero">Enter the Crashed Plane</h1>
              <p class="muted">
                Rock: Crashed Plane is a text-based MUD from the 1990s, reawakened for modern uptime.
                Explore a sci-fi and fantasy fusion where planes collide, the codebase is custom,
                and every login writes another page in the timeline.
              </p>
              <div class="button-row">
                <a class="btn primary" href="/signup.php">Create Account</a>
                <a class="btn ghost" href="/login.php">Operator Login</a>
                <a class="btn ghost" href="/forum.php">Community Forum</a>
              </div>
              <div class="grid-panels">
                <div class="panel">
                  <h3>Start Here</h3>
                  <p>
                    Register, then connect with your MUD client to port
                    <?php echo htmlspecialchars((string)rockserv_realm_telnet_port(), ENT_QUOTES); ?>
                    for <?php echo htmlspecialchars(rockserv_realm_label(), ENT_QUOTES); ?>.
                  </p>
                </div>
                <div class="panel">
                  <h3>Scoreboard</h3>
                  <p>Track the strongest adventurers and climb the ranks.</p>
                </div>
                <div class="panel">
                  <h3>Bulletin Board</h3>
                  <p>Race war briefings, trade posts, and strategy transmissions.</p>
                </div>
              </div>
            </div>
          </section>

          <section class="window">
            <div class="window-title">Overview</div>
            <div class="window-body">
              <p>
                Rock: Crashed Plane was a text-based MUD known for its original codebase and a world
                where science fiction and fantasy sit side by side. The original code was written by
                Plat, and after the live game shut down it was faithfully maintained by Morbis. The
                version running here is based on that maintained codebase.
              </p>
              <p>
                The crashed plane concept sits at the heart of the lore: planes of existence collide,
                opening portals to new realities, quests, and power systems that blend technology
                with arcane traditions. PvP is driven by race-based conflict across the dimensions.
              </p>
              <div class="badge">Custom-built since the 90s</div>
            </div>
          </section>

          <section class="window">
            <div class="window-title">Key Features</div>
            <div class="window-body">
              <div class="grid-panels">
                <div class="panel">
                  <h3>Custom Codebase</h3>
                  <p>Built from scratch to unlock unique mechanics and world rules.</p>
                </div>
                <div class="panel">
                  <h3>Races &amp; Classes</h3>
                  <p>Choose a path that balances tech, magic, and reputation.</p>
                </div>
                <div class="panel">
                  <h3>Exploration</h3>
                  <p>Traverse planes, uncover ruins, and map hidden transit nodes.</p>
                </div>
                <div class="panel">
                  <h3>Combat Options</h3>
                  <p>Run PvE hunts, duel rivals, or join race skirmishes.</p>
                </div>
                <div class="panel">
                  <h3>Story &amp; Lore</h3>
                  <p>Piece together the lost timeline of a shattered civilization.</p>
                </div>
                <div class="panel">
                  <h3>Racial Conflict</h3>
                  <p>Fight for your race across planes in a living PvP war.</p>
                </div>
              </div>
            </div>
          </section>

          <section class="window">
            <div class="window-title">In-Game Resources</div>
            <div class="window-body">
              <ul class="list">
                <li><span><a href="https://www.mudlet.org/" target="_blank" rel="noreferrer noopener">Mudlet</a></span><span>MUD client for desktop</span></li>
                <li><span><a href="https://itunes.apple.com/us/app/mudrammer-a-modern-mud-client/id597157072?platform=iphone#platform/iphone" target="_blank" rel="noreferrer noopener">MUDRammer</a></span><span>MUD client for iOS</span></li>
                <li><span><a href="https://play.google.com/store/apps/details?id=com.happygoatstudios.bt&hl=en_US" target="_blank" rel="noreferrer noopener">Blowtorch</a></span><span>MUD client for Android</span></li>
                <li><span><a href="http://rockcrashedplane.wikia.com/wiki/Rock_Crashed_Plane_Wiki" target="_blank" rel="noreferrer noopener">RCP Wiki</a></span><span>Community reference</span></li>
              </ul>
            </div>
          </section>

          <section class="window">
            <div class="window-title">Source Code</div>
            <div class="window-body">
              <ul class="list">
                <li><span><a href="https://sourceforge.net/p/rockserv/code/HEAD/tree/" target="_blank" rel="noreferrer noopener">Original Code</a></span><span>SourceForge archive</span></li>
                <li><span><a href="https://github.com/morbis02/rockserv2" target="_blank" rel="noreferrer noopener">Rockserv2</a></span><span>GitHub repository</span></li>
              </ul>
            </div>
          </section>
        </div>

        <aside class="sidebar">
          <section class="window">
            <div class="window-title">Server Console</div>
            <div class="window-body">
              <ul class="list">
                <li><span>Host</span> example.com</li>
                <li><span>Realm</span> <?php echo htmlspecialchars(rockserv_realm_label(), ENT_QUOTES); ?></li>
                <li><span>Telnet</span> <?php echo htmlspecialchars((string)rockserv_realm_telnet_port(), ENT_QUOTES); ?></li>
                <li><span>Patch</span> 2.0.13</li>
              </ul>
              <div class="badge">Classic shard online</div>
              <?php if ($special_event): ?>
                <div class="event-banner">
                  <strong>Special Event Live:</strong>
                  <?php echo htmlspecialchars((string)$special_event['label'], ENT_QUOTES); ?>
                  <?php if (!empty($special_event['description'])): ?>
                    <span class="event-desc">
                      <?php echo htmlspecialchars((string)$special_event['description'], ENT_QUOTES); ?>
                    </span>
                  <?php endif; ?>
                </div>
              <?php endif; ?>
            </div>
          </section>

          <section class="window talk-card">
            <div class="window-title">Rock Chat</div>
            <div class="window-body talk-window">
              <iframe class="talk-frame" src="/talk.php" title="Rock Chat"></iframe>
            </div>
          </section>

          <section class="window">
            <div class="window-title">Special Thanks</div>
            <div class="window-body">
              <p class="muted">
                Credit to Plat for the original Rock codebase and to Morbis for the modern
                maintained release. Visit
                <a href="https://muse.dillfrog.com/" target="_blank" rel="noreferrer noopener">Dillfrog.com</a>
                for more lore.
              </p>
            </div>
          </section>

          <section class="window">
            <div class="window-title">Quick Links</div>
            <div class="window-body link-grid">
              <a class="link-btn" href="/scores.php">Scoreboard</a>
              <a class="link-btn" href="/forum.php">Forums</a>
              <a class="link-btn" href="/signup.php">Signup</a>
              <a class="link-btn" href="/account.php">Account</a>
            </div>
          </section>
        </aside>
      </main>
<?php rockserv_render_footer(); ?>
