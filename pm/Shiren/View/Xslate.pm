package Shiren::View::Xslate;

use strict;
use warnings;

use Text::Xslate;

# override
sub new {
	my $class = shift;

	return Text::Xslate->new(
		syntax => 'TTerse'
	);
}

1;
