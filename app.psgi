use strict;
use warnings;

use Plack::App::URLMap;

my $app1 = sub {
    my $env = shift;
    return [
        200,
        [ 'Content-Type' => 'text/plain' ],
        [ "root directory here" ],
        ];
};


my $app2 = sub {
    my $env = shift;
    return [
        200,
        [ 'Content-Type' => 'text/plain' ],
        [ "fuga directory here" ],
        ];
};

my $app3 = sub {
    my $env = shift;
    return [
        200,
        [ 'Content-Type' => 'text/plain' ],
        [ "piyo directory here" ],
        ];
};

my $urlmap = Plack::App::URLMap->new;
$urlmap->map("/" => $app1);
$urlmap->map("/fuga" => $app2);
$urlmap->map("/fuga/piyo" => $app3);

my $app = $urlmap->to_app;
