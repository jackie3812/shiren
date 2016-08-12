package Shiren::Model;

use strict;
use warnings;

use parent qw/Teng/;

sub get_teng_obj {
	my $class = shift;
	my ($c) = @_;
    my $teng_obj = $c->cachable(
        "teng_obj",
        sub {$class->new(
                connect_info => [ dsn(), username(), password(), \(connect_options()) ]
        );}
    );

    return $teng_obj;
}

sub dsn { "dbi:mysql:database=shiren;host=localhost" }

sub username { "shiren" }

sub password { "shiren" }

sub connect_options { () }

1;
