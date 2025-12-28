<?php
declare(strict_types=1);
require_once __DIR__ . '/lib.php';

rockserv_logout_user();
rockserv_flash_set('Logged out', 'success');
header('Location: /');
exit;
