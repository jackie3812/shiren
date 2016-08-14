package Shiren::Page::Main::Signup::Index;

use strict;
use warnings;

use Shiren::Func::Util qw/redirect_to/;
use parent qw/Shiren::Page::Base/;

sub pre_action {
	my $self = shift;
	my $c = $self->get("context");
	my $session = $self->session;

	my $user_id = $session->get("user_id");
	redirect_to($c, "/profile") if $user_id;
}

sub action {
	my $self = shift;
}

1;
