package Shiren::Model::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
table {
    name 'user';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
        {name => 'password', type => 12},
        {name => 'created_at', type => 4},
    );
};

table {
    name 'userhoge';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
        {name => 'created_at', type => 4},
    );
};

1;

