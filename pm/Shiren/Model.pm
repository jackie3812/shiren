package Shiren::Model;

use strict;
use warnings;

use parent qw/Teng/;

# TODO 毎回connectするのではなく、キャッシュさせる
sub get_teng_obj {
	my $class = shift;
	my $teng = $class->new(
		connect_info => [ dsn(), username(), password(), \(connect_options()) ]
	);
}

sub dsn { "dbi:mysql:database=shiren;host=localhost" }

sub username { "shiren" }

sub password { "shiren" }

sub connect_options { () }

1;
