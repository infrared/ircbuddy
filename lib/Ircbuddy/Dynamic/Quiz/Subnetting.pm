package Ircbuddy::Dynamic::Quiz::Subnetting;
use strict;
use warnings;

use List::MoreUtils qw(pairwise);
use Ircbuddy::Core::Tools qw/ _randomip _dec2bin _bin2dec /;

use Ircbuddy::Core::Utils;

my $nu = Ircbuddy::Core::Utils->new;


my @games = ('network', 'hostbits','networkbits');




sub quiz {
    my $rand = int(rand(@games));
    my $sub = $games[$rand];
    no strict "refs";
    my @array = &$sub;

    return @array;
}

sub network {
    
        my $ip = &_randomip;
        my $prefix = (int rand 25) + 8;

        # mask in binary
        my $ones = $prefix;
        my $zeros = 32 - $prefix;
        my $binary_mask = 1 x $ones . 0 x $zeros;
        my @mask = split('',$binary_mask);

        # IP in binary
        my @octets = map{_dec2bin($_) } split('\.',$ip);
        my $join = join('',@octets);
        my @ipaddr = split('',$join);


        my @network = pairwise { $a & $b } @mask,@ipaddr;
        my $network_binary = join('',@network);
        my @network_octets = ($network_binary =~ /(\d{8})/g);
        my @decimals = map{ _bin2dec($_) } @network_octets;
        
        my $question = "Given $ip/$prefix, network address is?";
        my $answer = join('.',@decimals);
        
        my @array = ($question,$answer);
        return @array;
    
}
sub hostbits {
    my $random = int rand 128;
    my $question = "How many host bits are required for $random hosts?";
    my $answer = $nu->hostbits($random);
            my @array = ($question,$answer);
        return @array;
    
}
sub networkbits {
    my $random = int rand 128;
    my $question = "How many network bits are required for $random networks?";
    my $answer = $nu->networkbits($random);
            my @array = ($question,$answer);
        return @array;
    
}

1;
