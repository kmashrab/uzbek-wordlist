#!/usr/bin/perl
# Author: Mashrab Kuvatov <kmashrab@uni-bremen.de>

use Encode;

binmode( STDOUT, ":utf8" );
if ( $#ARGV != 0 ){
	print "Usage: FIXME\n";
	#print Encode::decode_utf8("\nФойдаланиш: new_words.pl wordlist1 wordlist2\n");
	exit;
}

my @w_root;

$w_root_file = $ARGV[0];

# Read list of the word root
open(INFILE, $w_root_file) || die "Cannot open file: $w_root_file\n";
while(<INFILE>){
	push( @w_root, Encode::decode_utf8( $_) );
}
close(INFILE);

for($w_indx=0; $w_indx<=$#w_root; $w_indx++){
	$w_cur = $w_root[$w_indx];
	# remove whitespaces
	$w_cur =~ s/\s+$//;
	print lc($w_cur) . Encode::decode_utf8("лик") . "\n";
}
