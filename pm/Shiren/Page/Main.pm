package Shiren::Page::Main;

use strict;
use warnings;

use parent qw/Shiren::Page::Base/;

sub index {
    my $class = shift;
    my $env = shift;
    $class->redirect_to("/fuga");
}

1;
