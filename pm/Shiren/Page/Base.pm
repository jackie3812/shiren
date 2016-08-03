package Shiren::Page::Base;

use strict;
use warnings;

use Plack::Response;

#### TODO
# $appのためのステータスコード返すメソッド用意
# $appのためのtext-type返すメソッド用意
# $appのためのhtmlを返すor橋渡しメソッド用意
###

sub redirect_to {
    my $class = shift;
    my ($url) = @_;

    my $res = Plack::Response->new;
    $res->redirect($url);
    return $res->to_app;
}

1;
