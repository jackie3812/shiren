package Shiren::Page::Base;

use strict;
use warnings;

use Plack::Request;
use Carp;

use parent qw/Class::Accessor/;
__PACKAGE__->follow_best_practice;
__PACKAGE__->mk_accessors(qw/context request pre_action_var action_var post_action_var/);

# override
sub new {
	my $class = shift;
	my ($env) = @_;

	my $request = $class->request($env);
	my $context = +{}; # Shiren::Page::Context->new; # TODO Page層が自由に呼び出せる。リクエストキャッシュしたいものはここに突っ込む
	my $pre_action_var = +{};
	my $action_var = +{};
	my $post_action_var = +{};

	return $class->SUPER::new({
		context         => $context,
		request         => $request,
		pre_action_var  => $pre_action_var,
		action_var      => $action_var,
		post_action_var => $post_action_var,
	});
}

sub request {
	my $class = shift;
	my ($env) = @_;

	return Plack::Request->new($env);
}

sub dispatch {
	my $self = shift;

	$self->pre_action;
	$self->action;
	$self->post_action;
}

# override
sub pre_action {
	my $self = shift;

	# TODO validationあればここでまとめてやりたい。各Page層はvalidation conditionを書くだけ
}

# override
sub action {
	my $self = shift;

	Carp::croak("Page::action must be overridden");
}

# override
sub post_action {
	my $self = shift;
}

1;
