package Shiren::Page::Main;

use strict;
use warnings;

sub index {
    my $app = sub {
        my $env = shift;
        return [
            200,
            [ 'Content-Type' => 'text/plain' ],
            [ "root directory here" ],
        ];
    }
}

1;
