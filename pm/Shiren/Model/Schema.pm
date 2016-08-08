package Shiren::Model::Schema;

use Teng::Schema::Declare;

table {
	name 'user';
	pk 'id';
	columns qw(id name created_at);
};

table {
	name 'userhoge';
	pk 'id';
	columns qw(id name created_at);
};
1
