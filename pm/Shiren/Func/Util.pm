package Shiren::Func::Util;

use strict;
use warnings;

use Plack::Response;

sub redirect_to {
	my $class = shift;
	my ($c, $url) = @_;

# 既にredirectが先の処理で呼ばれていたら上書きはしない
	return undef if $c->has_redirect;

	my $res = Plack::Response->new;
	$res->redirect($url);
	my $redirect_value = $res->finalize;

	$c->cachable("redirect", $redirect_value);
}

sub global_time {
	my $class = shift;
	my ($c) = @_;

	return $c->cachable("global_time", sub {time});
}

1;
