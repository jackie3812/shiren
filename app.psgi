use strict;
use warnings;

use Plack::Builder;

use lib qw{ pm };
use Shiren::Dispatcher;

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

builder {
	# describe middleware here like below when in need
	# enable "Session", store=> Plack::Session::Store::File->new(...);
    mount '/fuga' => builder {
        mount '/piyo' => $app2;
        mount '/' => $app1;
    };
	mount '/' => Shiren::Dispatcher->dispatch("Main::Index");
};
