package Shiren::Page::Main::Signup::Exec;

use strict;
use warnings;

use Digest::SHA;

use Shiren::Func::User;
use Shiren::Func::Util qw/redirect_to global_time/;
use parent qw/Shiren::Page::Base/;

sub validate_conditions {
	my $class = shift;
	return +[
		name      => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]],
		password  => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]],
		password2 => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]]
	];
}

sub pre_action {
	my $self = shift;
	my $c = $self->get("context");
	my $req = $self->get("request");

	# すでに登録済みのnameはダメ
	return redirect_to($c, "/signup/index") if Shiren::Func::User->is_registered_name($c, $req->param("name"));
}


sub action {
	my $self = shift;
}

1;
