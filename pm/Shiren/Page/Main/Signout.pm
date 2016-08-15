package Shiren::Page::Main::Signout;

use strict;
use warnings;

use Shiren::Func::Util qw/redirect_to/;
use parent qw/Shiren::Page::Main::Base/;

sub pre_action {
	my $self = shift;
	$self->SUPER::pre_action;
}

sub action {
	my $self = shift;
	my $session = $self->session;
	$session->remove("user_id");
}

sub post_action {
	my $self = shift;
	my $c = $self->get("context");
	redirect_to($c, "/");
}

1;
