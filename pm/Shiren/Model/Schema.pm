package Shiren::Model::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
table {
    name 'seq_user_challenge';
    pk 'id';
    columns (
        {name => 'id', type => 4},
    );
};

table {
    name 'seq_user_info';
    pk 'id';
    columns (
        {name => 'id', type => 4},
    );
};

table {
    name 'user_challenge';
    pk 'challenge_id';
    columns (
        {name => 'challenge_id', type => 4},
        {name => 'user_id', type => 4},
        {name => 'lv', type => 4},
        {name => 'hp', type => 4},
        {name => 'max_hp', type => 4},
        {name => 'power', type => 4},
        {name => 'max_power', type => 4},
        {name => 'created_at', type => 4},
        {name => 'updated_at', type => 4},
    );
};

table {
    name 'user_info';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
        {name => 'pass', type => 12},
        {name => 'challenge_id', type => 4},
        {name => 'created_at', type => 4},
    );
};

1;

