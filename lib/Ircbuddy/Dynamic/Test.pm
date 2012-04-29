package Ircbuddy::Dynamic::Test;

use strict;
use warnings;

use Ircbuddy::Dynamic::Quiz::Answer::IOS;


sub go {

    my ($self,$bot,$mess,$schema) = @_;
    
    my $message = $mess->{body};
    
    if ($message =~ /^test\s+answer/) {
        
        my ($try,$answer) = ($message =~ /^test\s+answer\s+(.*)\?\?\s+(.*)/);
        
        if (Ircbuddy::Dynamic::Quiz::Answer::IOS->check($answer,$try)) {
            $bot->reply($mess,"matches");
        }
        else {
            $bot->reply($mess,"doesn\'t match");
        }
    }
        
        
        
        

    

}


1;