#!/usr/bin/perl
# Author: Mashrab Kuvatov <kmashrab@uni-bremen.de>
use Encode;

my @words;
my @new_words;

binmode( STDOUT, ":utf8" );
if ( $#ARGV != 1 ){
	print "Usage: new_words.pl wordlist1 wordlist2\nOutputs words in wordlist2 which are not in wordlist1.\n";
	print Encode::decode_utf8("\nФойдаланиш: new_words.pl wordlist1 wordlist2\n");
	print Encode::decode_utf8("wordlist2'дан wordlist1'га кирмаган сўзларни кўрсатади.\n");
	exit;
}

# Read wordlist 1
open(INFILE, $ARGV[0] ) || die "Cannot open file: $ARGV[0]\n";
while(<INFILE>){
	push( @words, Encode::decode_utf8( $_) );
}
close(INFILE);

# Read wordlist 2
open(INFILE2, $ARGV[1] ) || die "Cannot open file: $ARGV[1]\n";
while(<INFILE2>){
	push( @new_words, Encode::decode_utf8( $_) );
}
close(INFILE2);

undef %is_word;
for (@words) { $is_word{$_} = 1 }

for($word=0; $word<=$#new_words; $word++){
	$new_word = $new_words[$word];
	$i = 0;
	if( !($is_word{$new_word} || $is_word{lc($new_word)}) ){
		print $new_word;
	}
}
