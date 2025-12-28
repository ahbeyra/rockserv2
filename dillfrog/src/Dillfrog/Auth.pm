# sql_auth.pm
# Primitive SQL replacement for Dillfrog::Auth

package Dillfrog::Auth;

use strict;
use DBI;
use Carp;
use Digest::MD5 qw(md5 md5_hex md5_base64);

# Function: new()
# Returns: a new instance of this object
sub new {
    my $proto = shift;
    my $self = {};
    bless($self, $proto);
    return $self;
}

sub db_get_conn {
    my $data_source = $main::db_datasource;
    my $username = $main::db_username;
    my $password = $main::db_password;
    return DBI->connect_cached(
        $data_source,
        $username,
        $password,
        { 'RaiseError' => 1, 'ChopBlanks' => 1, 'AutoCommit' => 1 }
    ) or confess "Could not connect to database!\n";
}

sub db_get_conn_local {
    my $db_name = $main::db_name;
    my $data_source = $main::db_datasource || "DBI:MariaDB:database=$db_name;host=$main::db_host";
    my $username = $main::db_username;
    my $password = $main::db_password;
    return DBI->connect_cached(
        $data_source,
        $username,
        $password,
        { 'RaiseError' => 1, 'ChopBlanks' => 1, 'AutoCommit' => 1 }
    ) or confess "Could not connect to database!\n";
}

# Function: authUserID($ip, $username, $cleartext_password)
# Returns: array of ($login_success, $reason, $uin)
sub authUserID {
    my ($self, $ip, $username, $cleartext_password) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT id_member, passwd, member_name FROM accounts WHERE member_name=?",
        undef,
        lc($username)
    );

    if (!defined $row) {
        return (0, "No such username", 0);
    }

    my $passwd = md5_hex($cleartext_password);
    if ($row->[1] ne $passwd) {
        return (0, "Invalid Password", 0);
    }

    return (1, "Successful Password", $row->[0]);
}

# Function: getUIN($username)
# Returns: the UIN for a given userid
sub getUIN {
    my ($self, $username) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT id_member FROM accounts WHERE member_name=?",
        undef,
        lc($username)
    );

    return 0 unless defined($row);
    return $row->[0];
}

# Function: authUIN($ip, $uin, $cleartext_password)
# Returns: array of ($login_success, $reason, $uin)
sub authUIN {
    my ($self, $ip, $uin, $cleartext_password) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT passwd, member_name FROM accounts WHERE id_member=?",
        undef,
        $uin
    );

    return (0, "No such username", 0) unless defined($row);

    my $passwd = md5_hex($cleartext_password);
    if ($row->[0] ne $passwd) {
        return (0, "Invalid Password", 0);
    }

    return (1, "Successful Password", 0);
}

# Function: logMessage($site_code, $event_code, $uin, $ip)
sub logMessage {
    my ($self, $site_code, $event_code, $uin, $ip) = @_;
    print "[$site_code] $uin $event_code by $ip at " . localtime() . "\n";
}

# Function: getEmail($uin)
sub getEmail {
    my ($self, $uin) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT email FROM accounts WHERE id_member=?",
        undef,
        $uin
    );

    return $row ? $row->[0] : "";
}

# Function: getGender($uin)
sub getGender {
    my ($self, $uin) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT gender FROM accounts WHERE id_member=?",
        undef,
        $uin
    );

    return $row ? $row->[0] : "N";
}

# Function: getUserID($uin)
sub getUserID {
    my ($self, $uin) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT member_name FROM accounts WHERE id_member=?",
        undef,
        $uin
    );

    return $row ? $row->[0] : "";
}

# Function: getAccountData($uin)
sub getAccountData {
    my ($self, $uin) = @_;
    my $dbh = $self->db_get_conn();
    my $sth = $dbh->prepare_cached("SELECT * FROM accounts WHERE id_member=?");
    $sth->execute($uin);
    my $hash_ref = $sth->fetchrow_hashref();
    $sth->finish();
    return $hash_ref;
}

# Function: setCensorByUIN($uin, $censor)
sub setCensorByUIN {
    my ($self, $uin, $censor) = @_;
    my $dbh = $self->db_get_conn();
    $dbh->do(
        "UPDATE accounts SET prefer_censor=? WHERE id_member=?",
        undef,
        $censor ? 'Y' : 'N',
        $uin
    );
}

# Function: isValidName($name)
sub isValidName {
    my ($self, $name) = @_;
    return (0, "Invalid characters.\n") unless ($name =~ m/^[A-Za-z0-9]+$/);
    return (0, "Name too long.\n") unless length($name) < 25;
    return (1, "");
}

# Function: isValidEmail($email)
sub isValidEmail {
    my ($self, $email) = @_;
    my $dbh = $self->db_get_conn();
    my $row = $dbh->selectrow_arrayref(
        "SELECT email FROM accounts WHERE email=?",
        undef,
        $email
    );
    return (0, "Another account is using that email address.\n") if $row;
    return (1, "");
}

# Function: createAccount
sub createAccount {
    my ($self, $ip, $userid, $cleartext_password, $fields) = @_;
    my $passwd = md5($cleartext_password);
    my $dbh = $self->db_get_conn();
    $dbh->do(
        "INSERT INTO accounts (member_name, email, passwd, active, userid_formatted, prefer_censor, gender)
         VALUES (?, ?, ?, '1', ?, 'N', ?)",
        undef,
        lc($userid),
        $fields->{'email'},
        $passwd,
        $userid,
        $fields->{'gender'} || 'N'
    );
    my $row = $dbh->selectrow_arrayref("SELECT LAST_INSERT_ID()");
    return ($row->[0], "");
}

1;
