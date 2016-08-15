package Shiren::Func::Challenge;

use strict;
use warnings;

use Shiren::Model::UserChallenge;

sub start {
	my $class = shift;
	my ($c, $user_info) = @_;

	my $user_challenge = Shiren::Model::UserChallenge->initialize($c, $user_info->id);
	my $challenge_id = $user_challenge->challenge_id;
	$user_info->update({challenge_id => $challenge_id});
}

sub build {
	my $class = shift;
	my ($c, $challenge_id) = @_;
	# TODO ちゃんとビルドする
	return Shiren::Model::UserChallenge->select_by_key($c, "challenge_id", $challenge_id);
}
1;
