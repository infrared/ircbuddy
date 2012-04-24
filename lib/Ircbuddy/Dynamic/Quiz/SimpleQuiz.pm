package Ircbuddy::Dynamic::Quiz::SimpleQuiz;
use strict;
use warnings;


use List::Util 'shuffle';




sub quiz {
        my ($self,$category,$level,$schema) = @_;


        my $all = $schema->resultset('SimpleQuiz')->search({
                category => $category,
                cert_level => $level,
        });
        my @random;
        if ($all->count) {
            while(my $row = $all->next) {
                push(@random,$row->quiz_id);
            }
            my $size = @random;
            my $rand = int rand $size;

            my $id = $random[$rand];


            my $search = $schema->resultset('SimpleQuiz')->find($id);

            if ($search) {
                my $question = $search->question;
                my $answer   = $search->answer;

                my @array = ($question,$answer);
                return @array;
            }

        }

}



1;
