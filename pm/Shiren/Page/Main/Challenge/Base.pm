package Shiren::Page::Main::Challenge::Base;

use strict;
use warnings;

use Shiren::Func::Util qw/redirect_to/;
use Shiren::Func::UserInfo;
use parent qw/Shiren::Page::Main::Base/;

sub pre_action {
	my $self = shift;
	$self->SUPER::pre_action; # ログインしているかチェック

	my $c = $self->get("context");
	my $user_info = $c->get("user_info");

	# 有効なchallenge_idがあるかチェック
	# 複数のchallengeを持てるようにするにはここを変更
	redirect_to($c, "/profile") unless $user_info->challenge_id;
}

1;
