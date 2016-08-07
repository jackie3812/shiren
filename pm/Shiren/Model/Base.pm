package Shiren::Model::Base;

use strict;
use warnings;

use parent qw/Teng/;

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
