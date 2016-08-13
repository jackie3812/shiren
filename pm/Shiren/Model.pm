package Shiren::Model;

use strict;
use warnings;

use parent qw/Teng/;

sub get_teng_obj {
	my $class = shift;
	my ($c) = @_;
    my $teng_obj = $c->cachable(
        "teng_obj",
        sub {$class->new(
                connect_info => [ dsn(), username(), password(), connect_options() ]
        );}
    );

    return $teng_obj;
}

sub dsn { "dbi:mysql:database=shiren;host=localhost" }

sub username { "shiren" }

sub password { "shiren" }

sub connect_options { +{AutoCommit => 0} }

# tengのupdateだとupdated_rowsが返ってくるのでちょっと頑張る
sub seq_id {
    my $class = shift;
    my ($teng, $table_name) = @_;
    my $sth = $teng->execute(
        "UPDATE $table_name set id=LAST_INSERT_ID(id+1)"
    );
    my $seq_id = $sth->{'mysql_insertid'};

    return $seq_id;
}

1;
