package Shiren::Model::User;

use strict;
use warnings;

use Shiren::Model;

sub select {
	my $class = shift;
	my ($id) = @_;

	my $teng = Shiren::Model->get_teng_obj;
	return $teng->single('user', { id => $id });
}

1;
