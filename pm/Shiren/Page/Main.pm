package Shiren::Page::Main;

use strict;
use warnings;

use Shiren::Func::Util;
use Shiren::View::Main;
use parent qw/Shiren::Page::Base/;

sub index {
	my $class = shift;
	return sub {
		my $env = shift;
		my $req = $class->request($env);

		# ここでFunc層とやり取りをして変数を集めてくる
		my $sample_var = "sample var";
		my $sample_var2 = "fugapiyo";

		my $var = +{};
		$var->{sample_var} = $sample_var;
		$var->{sample_var2} = $sample_var2;

		Shiren::View::Main->index($req, $var);
	}
}

1;
