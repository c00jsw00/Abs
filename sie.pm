package perl_lib::sie;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(file_number open_file do_avesie);
 
sub file_number {
                 my ($file,$number)  = @_;
                 my $cal  = `cat $file|wc -l`;
                 $number = $cal ;
                 return $number;
                }

sub open_file   {
                my ($file)  = @_;
                open my $info, $file or die "Could not open $file: $!";
                my $xx =1 ;
                while( my $line = <$info>)  
                     {   
                      #print $line ;
                      my $new_file = "temp.$xx";
                      open(my $fh, '>', $new_file);  
                      print $fh $line ;
                      close $fh ;
                      $xx = $xx +1 ;
                     }           
                close $info;
                }

sub do_avesie   {
                my ($new_number) =  @_;
                my $grep_file="Delta_G";
                for (my $i=1; $i<= $new_number; $i++)
                  {
                   system("/home/c00jsw00/bin/Brimm/bin/sietraj -ave temp.$i >o"); 
                   system("./main_grep.sh");                  
                  }
                }  
