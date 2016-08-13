package Shiren::Func::UserInfo;

use strict;
use warnings;

use Shiren::Model::UserInfo; # TODO wrapしたい

sub is_registered_name {
	my $class = shift;
	my ($c, $name) = @_;

	my $row = Shiren::Model::UserInfo->select_by_key($c, "name", $name);
	return $row ? 1 : 0;
}

1;
