use strict;
use warnings;

use DBI;
use Teng::Schema::Dumper;
use Shiren::Conf::DB;

my $db_name = Shiren::Conf::DB->db_name;
my $dbh = DBI->connect("$db_name",'','');
print Teng::Schema::Dumper->dump(
    dbh       => $dbh,
    namespace => 'Shiren::Model',
), "\;

1;
