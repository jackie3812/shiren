package Shiren::View::Main::Profile;

use strict;
use warnings;

use parent qw/Shiren::View::Base/;

sub view {
	my $class = shift;
	my ($request, $pre_action_var, $action_var, $post_action_var) = @_;

	my $user_info = $action_var->{user_info};

	my $view = +{};
	$view->{name} = $user_info->name;

	my $html = $class->render($view);
	$class->to_app($request, $html);
}

1;
