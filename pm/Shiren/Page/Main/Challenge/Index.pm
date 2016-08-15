package Shiren::Page::Main::Challenge::Index;

use strict;
use warnings;

use Shiren::Func::Util qw/redirect_to/;
use Shiren::Func::Challenge;
use parent qw/Shiren::Page::Main::Challenge::Base/;

sub pre_action {
	my $self = shift;
	$self->SUPER::pre_action;
}

sub action {
	my $self = shift;
	my $c = $self->get("context");
	my $user_info = $c->get("user_info");

	my $user_challenge = Shiren::Func::Challenge->build($c, $user_info->challenge_id);
	my $var = +{};
	$var->{user_challenge} = $user_challenge;

	$self->set_action_var($var);
}

1;
