package Shiren::Model::User::Schema;

use Teng::Schema::Declare;

table {
	name 'user';
	pk 'id';
	columns qw(id name created_at);
};

1
