package Shiren::Page::Main;

use strict;
use warnings;

use Shiren::Func::Util;
use parent qw/Shiren::Page::Base/;

sub index {
    my $class = shift;
    my $env = shift;
    Shiren::Func::Util->redirect_to("/fuga");
}

1;
