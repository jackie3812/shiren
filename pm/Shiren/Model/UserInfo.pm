package Shiren::Model::UserInfo;

use strict;
use warnings;

use Shiren::Model;
use Shiren::Func::Util qw/global_time/;

sub initialize {
	my $class = shift;
	my ($c, $name, $pass) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	my $id = Shiren::Model->seq_id($teng, "seq_user_info");
	$teng->insert(
		'user_info',
		{
			id           => $id,
			name         => $name,
			pass         => $pass,
			challenge_id => 0, # 挑戦中でない場合は0
			created_at   => global_time($c),
		}
	);
	return $teng->single('user_info', { id => $id });
}

sub select_by_key {
	my $class = shift;
	my ($c, $key, $value) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	return $teng->single('user_info', { $key => $value });
}

1;
