package Shiren::Func::Util;

use strict;
use warnings;

use Plack::Response;

sub redirect_to {
    my $class = shift;
    my ($url) = @_;

    my $res = Plack::Response->new;
    $res->redirect($url);

    return $res->to_app;
}

1;
