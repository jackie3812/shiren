#! perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../pm";
use Shiren::Model;
use DBI;
use Teng::Schema::Dumper;

my $dsn = Shiren::Model::dsn();
my $username = Shiren::Model::username();
my $pass = Shiren::Model::password();

my $dbh = DBI->connect("$dsn", "$username", "$pass");

print Teng::Schema::Dumper->dump(
    dbh       => $dbh,
    namespace => "Shiren::Mode;",
), "\n";
