use strict;
use warnings;

use Plack::Builder;
use Plack::Session::Store::File;

use lib qw{ pm };
use Shiren::Dispatcher;

builder {
	# describe middleware here like below when in need
	# enable "Session", store=> Plack::Session::Store::File->new(...);
    # mount '/fuga' => builder {
    #    mount '/piyo' => $app2;
    #    mount '/' => $app1;
    #};
	enable 'Session', store => Plack::Session::Store::File->new(dir => 'script/session');
	mount '/sample' => Shiren::Dispatcher->dispatch("Sample");

	mount '/' => Shiren::Dispatcher->dispatch("Main::Index");
	mount '/signup' => Shiren::Dispatcher->dispatch("Main::Signup::Index");
	mount '/signup/exec' => Shiren::Dispatcher->dispatch("Main::Signup::Exec");
#	mount '/signin' => Shiren::Dispatcher->dispatch("Main::Signin");
	mount '/profile' => Shiren::Dispatcher->dispatch("Main::Profile");
};
