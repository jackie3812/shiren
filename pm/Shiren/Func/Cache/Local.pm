package Shiren::Func::Cache::Local;

use strict;
use warnings;

my $CONTAINER = +{};

#TODO code_ref以外にもオブジェクトをキャッシュできるようにしたい
#TODO リクエストの最初で初期化処理必要
sub cachable {
	my $class = shift;
	my ($key, $code_ref) = @_;

	my $value = $class->get($key);

	return $value if $value;

	$value = &$code_ref;

	$class->set($key, $value);

	return $value;
}

sub get {
	my $class = shift;
	my ($key) = @_;

	my $value = $CONTAINER->{$key};

	return $value;
}

# TODO 上書きしようとしたら殺す？
sub set {
	my $class = shift;
	my ($key, $value) = @_;

	$CONTAINER->{$key} = $value;
}

1;
