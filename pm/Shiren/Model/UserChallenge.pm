package Shiren::Model::UserChallenge;

use strict;
use warnings;

use Shiren::Model;
use Shiren::Func::Util qw/global_time/;

sub initialize {
	my $class = shift;
	my ($c, $user_id) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	my $challenge_id = Shiren::Model->seq_id($teng, "seq_user_challenge");
	$teng->insert(
		'user_challenge',
		{
			challenge_id => $challenge_id,
			user_id      => $user_id,
			lv           => 1,
			exp          => 0,
			hp           => 10, # 後で他のモデルかConf見る, or Funcからの引数？ TODO
			max_hp       => 10, # 上に同じ TODO
			power        => 4, # TODO see above
			max_power    => 4, # TODO see above
			created_at   => global_time($c),
			updated_at   => global_time($c),
		}
	);
	return $teng->single('user_challenge', { challenge_id => $challenge_id }); 
}

sub select_by_key {
	my $class = shift;
	my ($c, $key, $value) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	return $teng->single('user_challenge', { $key => $value });
}
1;
