package Shiren::Model::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
table {
    name 'seq_user_info';
    pk 'id';
    columns (
        {name => 'id', type => 4},
    );
};

table {
    name 'user_info';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
        {name => 'pass', type => 12},
        {name => 'created_at', type => 4},
    );
};

1;

