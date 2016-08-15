package Shiren::Page::Main::ChallengeStart;

use strict;
use warnings;

use Shiren::Func::Transaction qw/begin commit/;
use Shiren::Func::Util qw/redirect_to/;
use Shiren::Func::Challenge;
use parent qw/Shiren::Page::Main::Base/;

sub pre_action {
	my $self = shift;
	$self->SUPER::pre_action;

	my $c = $self->get("context");
	my $user_info = $c->get("user_info");
	redirect_to($c, "/challenge/index") if $user_info->challenge_id;
}

sub action {
	my $self = shift;
	my $c = $self->get("context");
	my $user_info = $c->get("user_info");

	begin($c);
	Shiren::Func::Challenge->start($c, $user_info);
	commit($c);
}

sub post_action {
	my $self = shift;
	my $c = $self->get("context");
	redirect_to($c, "/challenge/index");
}

1;
