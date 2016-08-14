package Shiren::Page::Main::Profile;

use strict;
use warnings;

use Shiren::Func::Util qw/redirect_to/;
use Shiren::Model::UserInfo;
use parent qw/Shiren::Page::Base/;

sub pre_action {
	my $self = shift;
	my $c = $self->get("context");
	my $session = $self->session;

	my $user_id = $session->get("user_id");
	redirect_to($c, "/index") unless $user_id;

	my $user_info = Shiren::Func::UserInfo->select($c, $user_id);
	redirect_to($c, "/index") unless $user_info;

	$c->set("user_info", $user_info);
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
