package Shiren::Func::Transaction;

use strict;
use warnings;

use Shiren::Model;
use Exporter 'import';

our @EXPORT = qw/begin commit rollback/;

sub begin {
	my ($c) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	$teng->txn_begin;
}

sub commit {
	my ($c) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	$teng->txn_commit;
}

sub rollback {
	my ($c) = @_;

	my $teng = Shiren::Model->get_teng_obj($c);
	$teng->txn_rollback;
}
1;
