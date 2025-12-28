package rock_talker;
use strict;
use IO::Socket::INET;
use IO::Select;

sub broadcast {
    # $talker->broadcast($msgkey, $message)
    my $self = shift;
    $self->connect() if !$self->{'SOCK'};
    return if !$self->{'SOCK'};
    my $msg = $_[1] // '';
    $msg =~ s/[\r\n]+/ /g;
    $msg =~ s/\\[rn]/ /g;
    $msg =~ s/\s+$//g;
    eval { $self->{'SOCK'}->send("$_[0] $msg\n"); }
}

sub new {
    my $proto = shift;
    my $self = bless ({}, $proto);
    
    $self->connect();
    return $self;
}

sub handle_incoming {
    # add text to input log, catch long input
    $_[0]->{'IN_LOG'} .= $_[1];
    
    #### NOW, Assuming they hit return: 
    my $ret_index;
    print "LOG: [$_[0]->{'IN_LOG'}]\n";
    # for each line, 
    while(($ret_index = index($_[0]->{'IN_LOG'}, "\n")) != -1) {
        # copy first command to $line, minus the return
        my ($code, $msg) = substr($_[0]->{'IN_LOG'}, 0, $ret_index+1) =~ /^([^ ]+) (.+)$/;
        
        # kill the line from the input log, including the return.
        $_[0]->{'IN_LOG'} = substr($_[0]->{'IN_LOG'}, $ret_index+1);
        
        # And snag it for our own
        $_[0]->handle_code($code, $msg);
    }
}

sub handle_code {
    my ($self, $code, $msg) = @_;
    
    # R2-CHANREC(chan) formatted text
    # R2-CHANSND(chan) FROM TEXT
    if($code =~ /^R2-CHANSND\((\d+)\)$/) {
        my $chan = abs int $1;
        my ($from, $text) = $msg =~ /^(\S+)\s+(.+)$/;
        $from ||= 'Web';
        $text ||= '';
        $text =~ s/[\r\n]+//g;
        $text =~ s/\\[rn]/ /g;
        $text =~ s/\s{2,}/ /g;
        $text = &main::text_filter_censor($text, undef);
        my $cap = sprintf("{16}%s{17} shouts, \"{7}%s{17}\"\n", $from, $text);
        my $ghost = {
            'OBJID' => -1,
            'NAME' => $from,
        };
        &main::rock_talkshout($ghost, $cap, 'silence shouts');
    }
    
}

sub pump {
    my $self = shift;
    if (!$self->{'SOCK'}) {
        $self->connect();
        return;
    }
    return if !$self->{'SOCK'};

    $self->{'SEL'} ||= IO::Select->new($self->{'SOCK'});
    return if !$self->{'SEL'}->can_read(0);

    my $data = '';
    $self->{'SOCK'}->recv($data, 1024);
    return if !$data;
    $self->handle_incoming($data);
}

sub connect {
    my $self = shift;
    my $enabled = $ENV{'ROCKSERV_TALKER'};
    if (defined $enabled && $enabled =~ /^(0|off|false|no)$/i) {
        return;
    }

    my $host = $ENV{'ROCKSERV_TALKER_HOST'} || 'localhost';
    my $port = $ENV{'ROCKSERV_TALKER_PORT'} || 2332;

    # create a tcp connection to the specified host and port
    $self->{'SOCK'} = IO::Socket::INET->new(Proto     => "tcp",
                                    PeerAddr  => $host,
                                    PeerPort  => $port)
           or warn "WARNING: couldn't connect to the talker! $!"; return;

    $self->{'SOCK'}->autoflush(1) if $self->{'SOCK'};
}

1;
