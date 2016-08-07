package Shiren::View::Base;

use strict;
use warnings;

use Shiren::Func::Xslate;

# This class aims to return PSGI format value(meaning $app described Plack in CPAN);
# input from Page layer with some values then format and output $app
# this class had better use xslate or some template engine to create body

sub to_app {
	my $class = shift;
	my ($req, $var) = @_; # $req is Plack::Request instance. $var contains some parameters created by Page layer

	my $status = $class->create_status;
	my $header = $class->create_header;
	my $body = $class->create_body($var);

	my $res = $req->new_response($status, $header, $body);
	$res->finalize;
}

# とりあえず200だけ。エラーページではoverrideする。または引数を渡して返り値を変えられるようにする
sub create_status {
	my $class = shift;
	return 200;
}

# statusと同じくとりあえずtxt/htmlを返す
sub create_header {
	my $class = shift;
	return +{ 'Content-Type' => 'text/html' };
}

sub create_body {
	my $class = shift;
	my ($var) = @_;
	# ここでxslateファイルをパースしてbodyを作成する
	# TODO やるべきことは
	# 1:$varをxslateに渡してテンプレート内で参照できる形にすること
	# 2:.txファイルを渡された引数から(テンプレ名渡す必要ありそう)参照してくること
	return "sample text"
}

1;
