package Shiren::Model::Base;

use strict;
use warnings;

use parent qw/Teng/;

# override
sub new_hoge {
	my $class = shift;
	# TODO どこかにnewした結果のtengオブジェクトを突っ込んでおき、あればそれを返すだけ、なければnewをする挙動にしたい
}

1;
