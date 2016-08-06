package Shiren::View::Main;

use strict;
use warnings;

use parent qw/Shiren::View::Base/;

sub index {
	my $class = shift;
	my ($req, $view) = @_;

	# TODO xslateに渡すように$viewを整形する必要あり
	$class->to_app($req, $view);
}

1;
