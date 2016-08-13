package Shiren::Model::User;

use strict;
use warnings;

use Shiren::Model;

sub select_by_key {
	my $class = shift;
	my ($c, $key, $value) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	return $teng->single('user', { $key => $value });
}

1;
