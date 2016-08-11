package Shiren::Model;

use strict;
use warnings;

use parent qw/Teng/;

sub get_teng_obj {
	my $class = shift;
	my ($c) = @_;

	my $teng_obj = $c->get("teng_obj");

	unless (defined $teng_obj) {
		$teng_obj = $class->new(connect_info => [ dsn(), username(), password(), \(connect_options()) ]);
		$c->set("teng_obj", $teng_obj);
	}

	return $teng_obj;
}

sub dsn { "dbi:mysql:database=shiren;host=localhost" }

sub username { "shiren" }

sub password { "shiren" }

sub connect_options { () }

1;
