use strict;
use warnings;

use Plack::App::URLMap;

use lib qw{ pm };
use Shiren::Page::Main;

my $app1 = sub {
    my $env = shift;
    return [
        200,
        [ 'Content-Type' => 'text/plain' ],
        [ "fuga directory here" ],
        ];
};

my $app2 = sub {
    my $env = shift;
    return [
        200,
        [ 'Content-Type' => 'text/plain' ],
        [ "piyo directory here" ],
        ];
};

my $urlmap = Plack::App::URLMap->new;
$urlmap->map("/" => Shiren::Page::Main::index);
$urlmap->map("/fuga" => $app1);
$urlmap->map("/fuga/piyo" => $app2);

my $app = $urlmap->to_app;
