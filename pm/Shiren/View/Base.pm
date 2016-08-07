package Shiren::View::Base;

use strict;
use warnings;

use Carp qw/croak/;
use Text::Xslate;
use Shiren::View::Xslate;

# This class aims to return PSGI format value(meaning $app described Plack in CPAN);
# input from Page layer with some values then format and output $app
# this class had better use xslate or some template engine to create body

sub to_app {
	my $class = shift;
	my ($req, $html) = @_; # $req is Plack::Request instance
	my $status = $class->create_status;
	my $header = $class->create_header;

	my $res = $req->new_response($status, $header, $html);
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

sub render {
	my $class = shift;
	my ($file_name, $view) = @_;

	my $tx = Shiren::View::Xslate->new();
	my $file_path = $class->create_file_path_by_file_name($file_name);

	return $tx->render($file_path, $view);
}

# 1つのViewは1つのxslate配下のdir_nameと1対1対応
sub create_file_path_by_file_name {
	my $class = shift;
	my ($file_name) = @_;

	my $class_dir_name;
	if ($class =~ /Shiren::View::.*/) {
		$class_dir_name = $class;
		$class_dir_name =~ s/Shiren::View:://;
	} else {
		croak ("class name must be like Shiren::View::Hoge class name:$class");
	}

	# ::を/に置換してから、小文字にして末尾に.txをつける
	my $xslate_dir_name = $class_dir_name;
	$xslate_dir_name =~ s/::/\//g;
	$xslate_dir_name = lc($xslate_dir_name);
	return sprintf("xslate/%s/%s.tx", $xslate_dir_name, $file_name);
}

1;
