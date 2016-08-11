package Shiren::View::Sample;

use strict;
use warnings;

use parent qw/Shiren::View::Base/;

sub view {
	my $class = shift;
	my ($request, $pre_action_var, $action_var, $post_action_var) = @_;

	# ここで$varを整形して$viewにつめる
	my $view = $action_var;
	my $html = $class->render($view);

	$class->to_app($request, $html);
}

1;
