package Shiren::View::Base;

use strict;
use warnings;

# This class aims to return PSGI format value(meaning $app described Plack in CPAN);
# input from Page layer with some values then format and output $app
# this class had better use xslate or some template engine to create body

sub to_app {
	my $class = shift;
	my ($req,$val) = @_; # $req is Plack::Request instance. $val contains some parameters created by Page layer

	my $status = $class->create_status;
	my $header = $class->create_header;
	my $body = $class->create_body;

	my $res = $req->new_response($status, $header, $body);
	$res->finalize;
}

sub create_stutus {
	my $class = shift;
	return 200;
}

sub create_header {
	my $class = shift;
	return 'Content-Type' => 'text/plain'; # TODO 適当に入れたので動くかもわからん
}

sub create_body {
	my $class = shift;
	# ここでxslateファイルをパースしてbodyを作成する
}

1;
