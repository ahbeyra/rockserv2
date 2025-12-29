### PREFS, to be configured for use with Rock 2 upon startup.
#
#
package main;
use strict;

# TODO: Explain what each of these constants means and how it
#       affects the game.

#####################################################
# Directories
#####################################################
$main::base_code_dir = $ENV{'ROCKSERV_BASE_CODE_DIR'} || '/app/dillfrog/src'; # NOTE: no trailing /.
$main::base_web_dir = '/var/www/html/games/rs2';
$main::base_web_url = 'https://www.doyometer.com/';

#####################################################
# E-mail and Contact Information
#####################################################
$main::mail_program = "/usr/sbin/sendmail -t";
$main::rock_admin_email = $main::rock_support = 'support@doyometer.com';
$main::rock_serv_email = $main::rock_serv = 'support@doyometer.com';
$main::pop_mail_server = 'localhost';
$main::owner_name = "localhost";

#####################################################
# Database (MariaDB/MySQL/Postgres supported)
#####################################################
$main::db_driver = $ENV{'ROCKSERV_DB_DRIVER'} || 'mariadb';
$main::db_username = $ENV{'ROCKSERV_DB_USER'} || 'rockserv';
$main::db_password = $ENV{'ROCKSERV_DB_PASS'} || 'change_me';
$main::db_name = $ENV{'ROCKSERV_DB_NAME'} || 'r2_dillfrog';
$main::db_host = $ENV{'ROCKSERV_DB_HOST'} || 'localhost';
$main::db_port = $ENV{'ROCKSERV_DB_PORT'} || '';

sub build_db_datasource {
  my ($driver, $db_name, $host, $port) = @_;
  $driver = lc($driver || 'mysql');
  $host ||= 'localhost';
  $port ||= '';

  if ($driver eq 'pg' || $driver eq 'postgres' || $driver eq 'postgresql') {
    my $dsn = "DBI:Pg:dbname=$db_name;host=$host";
    $dsn .= ";port=$port" if $port;
    return $dsn;
  }

  if ($driver eq 'mysql' || $driver eq 'mariadb') {
    my $dsn = "DBI:MariaDB:database=$db_name;host=$host";
    $dsn .= ";port=$port" if $port;
    return $dsn;
  }

  my $dsn = "DBI:MariaDB:database=$db_name;host=$host";
  $dsn .= ";port=$port" if $port;
  return $dsn;
}

$main::db_datasource = build_db_datasource(
  $main::db_driver,
  $main::db_name,
  $main::db_host,
  $main::db_port
);

# LAST, override stuff (you wont usually use this, but .. it's here for the one guy who does)
do "$main::base_code_dir/rock_prefslocal.pm" if -e "$main::base_code_dir/rock_prefslocal.pm";

1;
