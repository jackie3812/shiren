package Shiren::Page::Sample;

use strict;
use warnings;

use Shiren::Func::Util;
use Shiren::Model::User;
use Shiren::Model::UserHoge;
use parent qw/Shiren::Page::Base/;

sub action {
	my $self = shift;
	my $c = $self->get("context");

	# ここでFunc層とやり取りをして変数を集めてくる
	my $sample_var = "sample var";
	my $sample_var2 = "fugapiyo";

	my $row = Shiren::Model::User->select($c,"1");
	my $name = $row->name;

	my $rowhoge = Shiren::Model::UserHoge->select($c, 1);
	my $namehoge = $rowhoge->name;

	my $var = +{};
	$var->{sample_var} = $sample_var;
	$var->{sample_var2} = $sample_var2;
	$var->{name_from_db} = $name;
	$var->{name_from_db_hoge} = $namehoge;
	$var->{time1} = Shiren::Func::Util->global_time($c);
	$var->{time2} = Shiren::Func::Util->global_time($c);

	$self->set_action_var($var);
}

1;
