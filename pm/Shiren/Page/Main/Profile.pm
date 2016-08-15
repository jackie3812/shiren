package Shiren::Page::Main::Profile;

use strict;
use warnings;

use parent qw/Shiren::Page::Main::Base/;

sub pre_action {
	my $self = shift;
	$self->SUPER::pre_action;
}

sub action {
	my $self = shift;
	my $c = $self->get("context");
	my $user_info = $c->get("user_info");

	my $var = +{};
	$var->{user_info} = $user_info;

	$self->set_action_var($var);
}

1;
