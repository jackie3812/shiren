package Shiren::View::Main;

use strict;
use warnings;

use parent qw/Shiren::View::Base/;

sub index {
	my $class = shift;
	my ($req, $var) = @_;

	# ここで$varを整形して$viewにつめる
	my $view = $var;
	my $html = $class->render("index", $view);

	$class->to_app($req, $html);
}

1;
