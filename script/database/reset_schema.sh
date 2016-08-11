#! /bin/bash
PASS=$1
SCRIPT_PATH=$HOME/projects/shiren/script/database

mysql -u shiren --password=$PASS -e 'drop database shiren'

mysql -u shiren --password=$PASS -e 'create database shiren'

mysql -u shiren --password=$PASS shiren < $SCRIPT_PATH/schema.sql

carton exec -- perl $SCRIPT_PATH/schema_dumper.pl > $HOME/projects/shiren/pm/Shiren/Model/Schema.pm
