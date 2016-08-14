package Shiren::Page::Base;

use strict;
use warnings;

use Plack::Request;
use Carp;
use FormValidator::Simple;
use Shiren::Page::Context;

use parent qw/Class::Accessor/;
__PACKAGE__->follow_best_practice;
__PACKAGE__->mk_accessors(qw/context request pre_action_var action_var post_action_var/);

# override
sub new {
	my $class = shift;
	my ($env) = @_;

	my $request = $class->request($env);
	my $context = Shiren::Page::Context->new; # Func層に引き渡して使う。リクエストキャッシュしたいものはここに突っ込む。
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

sub env {
	my $self = shift;
	my $req = $self->get("request");
	return $req->env;
}

sub dispatch {
	my $self = shift;

	$self->validate;

	$self->pre_action;
	$self->action unless $self->has_redirect;
	$self->post_action unless $self->has_redirect;
}

sub validate {
	my $self = shift;
	my $class = ref $self;
	my $req = $self->get("request");

	my $validate_conditions = $class->validate_conditions;
	return undef unless scalar @$validate_conditions > 0;

	my $result = FormValidator::Simple->check($req => $validate_conditions);
	die if $result->has_error;
}

# override
sub validate_conditions {
	my $class = shift;
	return +[];
}

# override
sub pre_action {
	my $self = shift;
}

# override
sub action {
	my $self = shift;
}

# override
sub post_action {
	my $self = shift;
}

sub has_redirect {
	my $self = shift;
	return $self->redirect_value ? 1 : 0;
}

sub redirect_value {
	my $self = shift;
	my ($c) = $self->get("context");
	return $c->redirect_value;
}

1;
