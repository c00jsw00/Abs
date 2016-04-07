#!/usr/bin/perl
use strict;
use warnings;
use perl_lib::sie qw(file_number);
use perl_lib::sie qw(open_file);
use perl_lib::sie qw(do_avesie);
######################################################
system ("rm -rf temp.*");
system ("rm -rf all.sie*");
#####################################################
my $file = "sie.out";
my $number = 0;
#print  file_number($file,$number);
my $new_number = file_number($file,$number);
#printf "$new_number\n";
open_file($file);
do_avesie($new_number);

