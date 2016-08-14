package Shiren::Page::Signin::Exec;

use strict;
use warnings;

use Digest::SHA qw/sha256/;

use Shiren::Func::UserInfo;
use Shiren::Func::Util qw/redirect_to global_time/;
use Shiren::Func::Transaction qw/begin commit rollback/;
use parent qw/Shiren::Page::Base/;

sub validate_conditions {
	my $class = shift;
	return +[
		name  => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]],
		pass  => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]],
	];
}

sub pre_action {
	my $self = shift;
	my $c = $self->get("context");
	my $req = $self->get("request");

	# すでにセッションを持っていたらリダイレクト
	my $session = $self->session;
	my $user_id = $session->get("user_id");
	redirect_to($c, "/profile") if $user_id;

	# 存在しないnameだったらリダイレクト
	return redirect_to($c, "/signin/index") unless Shiren::Func::UserInfo->is_registered_name($c, $req->param("name"));

	# passが一致しているかの確認
	my $digested_pass = sha256($req->param("pass"));
	my $user_info_row = Shiren::Func::UserInfo->select_by_name($c, $req->param("name"));
	my $pass = $user_info_row->pass;
	return redirect_to($c, "/signin/index") unless $digested_pass eq $pass;

	$c->set("user_id", $user_info_row->id);
}

sub action {
	my $self = shift;
	my ($c) = $self->get("context");

	# sessionに突っ込む
	my $session = $self->session;
	$session->set("user_id", $c->get("user_id"));
}

sub post_action {
	my $self = shift;
	my $c = $self->get("context");
	redirect_to($c, "/profile");
}

1;
