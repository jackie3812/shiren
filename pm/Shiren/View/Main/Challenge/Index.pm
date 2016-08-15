package Shiren::View::Main::Challenge::Index;

use strict;
use warnings;

use parent qw/Shiren::View::Base/;

sub view {
	my $class = shift;
	my ($request, $pre_action_var, $action_var, $post_action_var) = @_;

	my $user_challenge = $action_var->{user_challenge};

	my $view = +{};
	$view->{challenge_id} = $user_challenge->challenge_id;
	$view->{user_id} = $user_challenge->user_id;
	$view->{lv} = $user_challenge->lv;
	$view->{exp} = $user_challenge->exp;
	$view->{hp} = $user_challenge->hp;
	$view->{max_hp} = $user_challenge->max_hp;
	$view->{power} = $user_challenge->power;
	$view->{max_power} = $user_challenge->max_power;

	my $html = $class->render($view);
	$class->to_app($request, $html);
}

1;
