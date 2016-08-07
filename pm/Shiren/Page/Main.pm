package Shiren::Page::Main;

use strict;
use warnings;

use Shiren::Func::Util;
use Shiren::View::Main;
use Shiren::Model::User;
use parent qw/Shiren::Page::Base/;

sub index {
	my $class = shift;
	return sub {
		my $env = shift;
		my $req = $class->request($env);

		# ここでFunc層とやり取りをして変数を集めてくる
		my $sample_var = "sample var";
		my $sample_var2 = "fugapiyo";

		my $row = Shiren::Model::User->select(1);
		my $name = $row->name;

		my $var = +{};
		$var->{sample_var} = $sample_var;
		$var->{sample_var2} = $sample_var2;
		$var->{name_from_db} = $name;

		Shiren::View::Main->index($req, $var);
	}
}

1;
