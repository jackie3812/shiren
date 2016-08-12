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

sub dispatch {
	my $self = shift;

	$self->validate;

	$self->pre_action;
	$self->action;
	$self->post_action;
}

sub validate {
	my $self = shift;
	my $class = ref $self;

	my $validate_conditions = $class->validate_conditions;
	return undef unless scalar @$validate_conditions > 0;

	my $result = FormValidator::Simple->check($self->get_request => $validate_conditions);
	use Data::Dumper;print Dumper $result->error;
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
