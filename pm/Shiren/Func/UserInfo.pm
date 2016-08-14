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

sub initialize {
	my $class = shift;
	my ($c, $name, $pass) = @_;

	my $user_info_row = Shiren::Model::UserInfo->initialize($c, $name, $pass);
	return $user_info_row;
}

sub select {
	my $class = shift;
	my ($c, $user_id) = @_;
	return Shiren::Model::UserInfo->select_by_key($c, "id", $user_id);
}
1;
