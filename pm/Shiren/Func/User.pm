package Shiren::Func::User;

use strict;
use warnings;

use Shiren::Model::User; # TODO wrapしたい

sub is_registered_name {
	my $class = shift;
	my ($c, $name) = @_;

	my $row = Shiren::Model::User->select_by_key($c, "name", $name);
	return $row ? 1 : 0;
}

1;
