package Shiren::Model;

use strict;
use warnings;

use Shiren::Func::Cache::Local;
use parent qw/Teng/;

sub get_teng_obj {
	my $class = shift;

	return Shiren::Func::Cache::Local->cachable(
		"teng_obj",
		sub {
			$class->new(
				connect_info => [ dsn(), username(), password(), \(connect_options()) ]
			);
		}
	);
}

sub dsn { "dbi:mysql:database=shiren;host=localhost" }

sub username { "shiren" }

sub password { "shiren" }

sub connect_options { () }

1;
