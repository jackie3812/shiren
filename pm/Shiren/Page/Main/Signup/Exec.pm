package Shiren::Page::Main::Signup::Exec;

use strict;
use warnings;

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
	my $self = @_;
	# TODO すでに登録済みかチェックするのと送られてきたパラメータにおかしな形式がないかチェック
	# my $c = $self->get("context");
}


sub action {
	my $self = shift;
}

1;
