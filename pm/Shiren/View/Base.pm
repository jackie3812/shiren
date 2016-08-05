package Shiren::View::Base;

use strict;
use warnings;

use Shiren::Func::Xslate;

# This class aims to return PSGI format value(meaning $app described Plack in CPAN);
# input from Page layer with some values then format and output $app
# this class had better use xslate or some template engine to create body

sub to_app {
	my $class = shift;
	my ($req,$val) = @_; # $req is Plack::Request instance. $val contains some parameters created by Page layer

	my $status = $class->create_status;
	my $header = $class->create_header;
	my $body = $class->create_body($val);

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
	my ($val) = @_;
	# ここでxslateファイルをパースしてbodyを作成する
	# TODO やるべきことは
	# 1:$valをxslateに渡してテンプレート内で参照できる形にすること
	# 2:.txファイルを渡された引数から(テンプレ名渡す必要ありそう)参照してくること
}

1;
