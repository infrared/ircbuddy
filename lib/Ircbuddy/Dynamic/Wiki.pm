package Ircbuddy::Dynamic::Wiki;

use strict;
use warnings;
use WWW::Wikipedia;

my $wiki = WWW::Wikipedia->new();




sub go {
    
    my ($self,$bot,$mess) = @_;
    
    my ($term) = ($mess->{body} =~ /^wiki\s+(.*)/);
    
      my $result = $wiki->search($term);
      if ($result) {
    
            $bot->reply($mess,$result->text);
      }
      else {
        $bot->reply($mess,"error");
      }

}

1;