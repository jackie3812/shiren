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
		if (ref($origin) eq ("SCALAR" || "HASH")) {
			$value = $origin;
		} elsif (ref($origin) eq "CODE") {
			$value = $origin->();
		}
		Carp::croak("tyring to cache undef value") unless $value;

		$self->set($key, $value);
	}

	return $value;
}

1;
