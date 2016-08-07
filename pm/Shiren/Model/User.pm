package Shiren::Model::User;

use strict;
use warnings;

use parent qw/Shiren::Model::Base/;

sub select {
	my $class = shift;
	my ($id) = @_;

	my $teng = $class->get_teng_obj;
	return $teng->single('user', { id => $id });
}

1;
