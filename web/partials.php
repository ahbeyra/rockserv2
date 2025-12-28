<?php
declare(strict_types=1);
require_once __DIR__ . '/lib.php';

function rockserv_nav_items(): array {
    $items = [
        ['/', 'Home'],
        ['/signup.php', 'Signup'],
        ['/scores.php', 'Scoreboard'],
        ['/forum.php', 'Forum'],
    ];

    $user = rockserv_current_user();
    if ($user) {
        $items[] = ['/account.php', 'Account'];
        $items[] = ['/logout.php', 'Logout'];
    } else {
        $items[] = ['/login.php', 'Login'];
    }

    return $items;
}

function rockserv_render_header(string $title, string $tagline, bool $show_ticker = true): void {
    $safe_title = htmlspecialchars($title, ENT_QUOTES);
    $safe_tagline = htmlspecialchars($tagline, ENT_QUOTES);
    $game = rockserv_game();
    $game_label = htmlspecialchars(rockserv_realm_label($game), ENT_QUOTES);
    $telnet_port = rockserv_realm_telnet_port($game);
    $items = rockserv_nav_items();

    echo "<!doctype html>\n";
    echo "<html lang=\"en\">\n";
    echo "  <head>\n";
    echo "    <meta charset=\"utf-8\">\n";
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
    echo "    <title>{$safe_title}</title>\n";
    echo "    <link rel=\"stylesheet\" href=\"/styles.css\">\n";
    echo "  </head>\n";
    echo "  <body>\n";
    echo "    <div class=\"scanlines\" aria-hidden=\"true\"></div>\n";
    echo "    <div class=\"screen\">\n";
    echo "      <header class=\"topbar\">\n";
    echo "        <div class=\"brand\">\n";
    echo "          <div class=\"logo\">ROCK: CRASHED PLANE</div>\n";
    echo "          <div class=\"tagline\">{$safe_tagline}</div>\n";
    echo "        </div>\n";
    echo "        <div class=\"status\">\n";
    echo "          <span class=\"status-dot\"></span>\n";
    echo "          STATUS: ONLINE\n";
    echo "        </div>\n";
    echo "      </header>\n";
    echo "      <nav class=\"nav\">\n";
    foreach ($items as [$href, $label]) {
        $safe_label = htmlspecialchars($label, ENT_QUOTES);
        echo "        <a href=\"{$href}\">{$safe_label}</a>\n";
    }
    echo "        <div class=\"realm-switch\">\n";
    echo "          <span>Realm</span>\n";
    foreach (rockserv_allowed_realms() as $realm => $label) {
        $safe_label = htmlspecialchars($label, ENT_QUOTES);
        $href = htmlspecialchars(rockserv_realm_url($realm), ENT_QUOTES);
        $active = $realm === $game ? ' active' : '';
        echo "          <a class=\"realm-link{$active}\" href=\"{$href}\">{$safe_label}</a>\n";
    }
    echo "        </div>\n";
    echo "      </nav>\n";

    if ($show_ticker) {
        echo "      <div class=\"ticker\">\n";
        echo "        <div class=\"ticker-track\">\n";
        echo "          <span>Welcome to Rock: Crashed Plane</span>\n";
        echo "          <span>Now accepting new recruits</span>\n";
        echo "          <span>Telnet port {$telnet_port}</span>\n";
        echo "          <span>Realm: {$game_label}</span>\n";
        echo "        </div>\n";
        echo "      </div>\n";
    }
}

function rockserv_render_flash(): void {
    $flash = rockserv_flash_get();
    if ($flash === null) {
        return;
    }
    $type = htmlspecialchars($flash['type'], ENT_QUOTES);
    $message = htmlspecialchars($flash['message'], ENT_QUOTES);
    echo "<div class=\"notice {$type}\">{$message}</div>\n";
}

function rockserv_render_footer(): void {
    echo "    </div>\n";
    echo "  </body>\n";
    echo "</html>\n";
}
