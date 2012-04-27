package Ircbuddy::Dynamic::Help;

use strict;
use warnings;

my %help = (
        learn => "Learn a definition. Syntax:  learn <term>: <definintion>",
        relearn => "Relearn a definition. Syntax: relearn <term>: <definition>",
        forget  => "Deleted a definition. Syntax: forget <term>",
        search => "Searches the glossary. Syntax: search <term>",
        register => "Register with me so you can help contribute. To register, type \"register\" in a private message with me",
        auth => "Authenticate with me. Must be registered. Syntax:  auth <password>",
        hex2bin => "Returns hex value in binary:  hex2bin <value>",
        hex2dec => "Returns hex value in decimal:  hex2dec <value>",
        network => "Returns network address of a given IP/prefix. Syntax: network <address>/<prefix>",
        broadcast => "Returns broadcast address of a given IP/prefix. Syntax: broadcast <address>/<prefix>",
        quiz => "Available quiz subjects: definitions, subnetting, bin2hex. Syntax: quiz me on <subject>",
        ip2hex => "Returns given IP address in hex. Syntax: ip2hex <address>",
		messages => "Messaging tool. Must be registered and auth'd. Syntax: messages, message new <user> <message>, message get <id>, message del <id>",
        listdefines =>  "List all definitions. Syntax: listdefines <page number>",
		source => "Returns a URL to my source code",
		stats => "Returns database statistics",
		repeat => "repeats a question",
		calc  => "perform calculations using Google. Sytanx: calc <string>",
);


sub go {
    my (undef,$self,$mess) = @_;

	my $message = $mess->{body};
	if ($message =~ /^help$/) {
		my @all = keys (%help);

		$self->reply($mess,join(', ',@all) . ". More help is available:  help <topic>");
	}
	if ($message =~ /^help\s+.*/) {
		my ($thing) = ($message =~ /^help\s+(.*)/);
		if (exists $help{$thing}) {
			$self->reply($mess,$help{$thing});
		}
		else {
			$self->reply($mess,"No help on that");
		}
	}


}


1;