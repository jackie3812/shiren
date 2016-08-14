package Shiren::Page::Signup::Exec;

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
		pass2 => ['NOT_BLANK', 'ASCII', ['LENGTH', 1, 20]]
	];
}

sub pre_action {
	my $self = shift;
	my $c = $self->get("context");
	my $req = $self->get("request");

	# すでに登録済みのnameはダメ
	return redirect_to($c, "/signup/index") if Shiren::Func::UserInfo->is_registered_name($c, $req->param("name"));

	# passが一致しているかの確認
	# TODO 別にSHA通してから一致確認しなくても良いかも。F::UserInfoでinitializeする時で良さそう
	my $digested_pass = sha256($req->param("pass"));
	my $digested_pass2 = sha256($req->param("pass2"));
	return redirect_to($c, "/signup/index") unless $digested_pass eq $digested_pass2;
	$c->set_cache("digested_pass", $digested_pass); # actionで再度計算させない
}

sub action {
	my $self = shift;
	my ($c) = $self->get("context");
	my $req = $self->get("request");
	my $digested_pass = $c->get_cache("digested_pass");
	my $name = $req->param("name");

	begin($c);
	my $user_info_row = Shiren::Func::UserInfo->initialize($c, $name, $digested_pass);
	commit($c);

	# sessionに突っ込む
	my $session = $self->session;
	$session->set("user_id", $user_info_row->id);
}

sub post_action {
	my $self = shift;
	my $c = $self->get("context");
	redirect_to($c, "/profile");
}

1;
