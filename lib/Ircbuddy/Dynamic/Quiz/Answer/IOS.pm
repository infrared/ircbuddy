package Ircbuddy::Dynamic::Quiz::Answer::IOS;

use strict;
use warnings;

use Text::Abbrev;


sub check {
    my ($self,$answer,$input) = @_;
    
    my @try = ($input =~ /(\S+)/g);
    

    my (@answers) = ($answer =~ /(\S+)/g);

    my $x = 0;
    for my $each (@answers) {

        my @valid;
        my ($first) = ($each =~ /([\.\-\d\w\/]+)\(?/);
        push (@valid,$first);

        if ($each =~ /\(\S+\)/) {

                my ($extra) = ($each =~ /\((\S+)\)/);
                my %hash = abbrev $extra;

                for (keys %hash) {
                        push @valid, $first . $_;
                }
        }
        return 0 unless grep(lc $try[$x] eq lc $_,@valid);
        $x++;
    }
    return 1;

}



1;
