package Shiren::Model::UserHoge;

use strict;
use warnings;

use Shiren::Model;

sub select {
	my $class = shift;
	my ($c, $id) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	return $teng->single('userhoge', { id => $id });
}

1;
