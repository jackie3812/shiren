package Shiren::Func::Xslate;

use strict;
use warnings;

use Text::Xslate;

# override
sub new {
	$class = shift;

	return Text::Xslate->new(
		syntax => 'TTerse'
	);
}

1;
