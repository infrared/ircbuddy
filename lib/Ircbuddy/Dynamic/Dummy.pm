package Ircbuddy::Dynamic::Dummy;

use strict;
use warnings;
use WWW::Wikipedia;
use Text::Autoformat;

my $wiki = WWW::Wikipedia->new();




sub go {
    
    my ($self,$bot,$mess) = @_;

       $bot->reply($mess,"works");
     
}

1;