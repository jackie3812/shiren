package Shiren::Page::Sample;

use strict;
use warnings;

use Shiren::Func::Util qw/global_time/;
use Shiren::Model::UserInfo;
use parent qw/Shiren::Page::Base/;

sub action {
	my $self = shift;
	my $c = $self->get("context");

	# ここでFunc層とやり取りをして変数を集めてくる
	my $sample_var = "sample var";
	my $sample_var2 = "fugapiyo";

	my $row = Shiren::Model::UserInfo->select_by_key($c, "id", "0");
	my $name = $row->name;

	my $var = +{};
	$var->{sample_var} = $sample_var;
	$var->{sample_var2} = $sample_var2;
	$var->{name_from_db} = $name;
	$var->{time1} = global_time($c);
	$var->{time2} = global_time($c);

	$self->set_action_var($var);
}

1;
