package Shiren::Page::Main::Signup::Exec;

use strict;
use warnings;

use Digest::SHA qw/sha256/;

use Shiren::Func::User;
use Shiren::Func::Util qw/redirect_to global_time/;
use parent qw/Shiren::Page::Base/;

sub validate_conditions {
	my $class = shift;
	return +[
		name  => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]],
		pass  => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]],
		pass2 => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]]
	];
}

sub pre_action {
	my $self = shift;
	my $c = $self->get("context");
	my $req = $self->get("request");

	# すでに登録済みのnameはダメ
	return redirect_to($c, "/signup/index") if Shiren::Func::User->is_registered_name($c, $req->param("name"));

	# passが一致しているかの確認
	my $digested_pass = sha256($req->param("pass"));
	my $digested_pass2 = sha256($req->param("pass2"));
	return redirect_to($c, "/signup/index") unless $digested_pass eq $digested_pass2;
}


sub action {
	my $self = shift;
}

1;
