package Shiren::Page::Base;

use strict;
use warnings;

use Plack::Request;

sub request {
	my $class = shift;
	my ($env) = @_;

	return Plack::Request->new($env);
}

1;
