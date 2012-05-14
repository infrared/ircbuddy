package Ircbuddy::Dynamic::Stats;

use strict;
use warnings;
use Crypt::PasswdMD5;

sub go {

    my ($self,$bot,$mess,$schema) = @_;
    my $message = $mess->{body};
    
    if ($message =~ /^(stats|status)$/) {
        my $glossary  = $schema->resultset('Glossary')->search->count;
        my $questions = $schema->resultset('MCQuiz')->search->count;
        my $quiz      = $schema->resultset('SimpleQuiz')->search->count;
        $bot->reply($mess,"Glossary: $glossary, Multiple Choice: $questions, Quiz: $quiz");
    }

}


1;