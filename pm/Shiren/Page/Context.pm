package Shiren::Page::Context;

use strict;
use warnings;

use Carp;
use parent qw/Class::Accessor/;
__PACKAGE__->follow_best_practice;

sub cachable {
	my $self = shift;
	my ($key, $origin) = @_;

	my $value = $self->get($key);
	unless (defined $value) {
		if (ref($origin) eq ("CODE")) {
			$value = $origin->();
		} else {
			$value = $origin;
		}
		Carp::croak("tyring to cache undef value") unless defined $value;

		$self->set($key, $value);
	}

	return $value;
}

sub set_cache {
	my $self = shift;
	my ($key, $origin) = @_;

	my $value = $self->get($key);
	Carp::croak("trying to overwrite cached value with key:$key") if defined $value;

	if (ref($origin) eq ("CODE")) {
		$value = $origin->();
	} else {
		$value = $origin;
	}
	Carp::croak("tyring to cache undef value") unless defined $value;
	$self->set($key, $value);
}

sub get_cache {
	my $self = shift;
	my ($key) = @_;
	return $self->get("$key");
}

sub has_redirect {
	my $self = shift;
	return $self->redirect_value ? 1 : 0;
}

sub redirect_value {
	my $self = shift;
	return $self->get("redirect");
}
1;
