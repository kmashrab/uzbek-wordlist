#!/usr/bin/perl
# Author: Mashrab Kuvatov <kmashrab@uni-bremen.de>

use Encode;

binmode( STDOUT, ":utf8" );
if ( $#ARGV != 0 ){
  print "Reads root word from the given file and suffixes from corresponding .afx file.\n";
  print "Adds every suffix to each word and prints out to std out.\n";
  print "Usage: root-word-file\n";
  exit;
}

my @w_root;
my @w_suffix;

$w_root_file = $ARGV[0];
$w_suffix_file = $w_root_file . ".afx";

# Read list of the word root
open(INFILE, $w_root_file) || die "Cannot open file: $w_root_file\n";
while(<INFILE>){
  push( @w_root, Encode::decode_utf8( $_) );
}
close(INFILE);

# Read list of suffices
open(INFILE2, $w_suffix_file) || die "Cannot open file: $w_suffix_file\n";
while(<INFILE2>){
  push( @w_suffix, Encode::decode_utf8( $_) );
}
close(INFILE2);
for($w_indx=0; $w_indx<=$#w_root; $w_indx++){
  $w_cur = $w_root[$w_indx];
  # remove whitespaces
  $w_cur =~ s/\s+$//;
  $w_cur_end = substr($w_cur, length($w_cur) - 1);
  print $w_cur . "\n";
  for($sfx_indx=0; $sfx_indx<=$#w_suffix; $sfx_indx++){
    $w_cur_tmp = $w_cur;
    $sfx_cur = $w_suffix[$sfx_indx];
    # remove whitespaces
    $sfx_cur =~ s/\s+$//;
    $sfx_special = substr($sfx_cur, 0, 1);
    if($sfx_special eq Encode::decode_utf8("г") &&
       ($w_cur_end eq Encode::decode_utf8("к") || 
        $w_cur_end eq Encode::decode_utf8("қ"))){
      $sfx_cur = $w_cur_end . substr($sfx_cur, 1, length($sfx_cur) - 1);
    }
    else {
      if($sfx_special eq Encode::decode_utf8("и") &&
         $w_cur_end eq Encode::decode_utf8("и")){
        $sfx_cur = substr($sfx_cur, 1, length($sfx_cur) - 1);
      }
      else {
        if($sfx_special eq Encode::decode_utf8("т") &&
           $w_cur_end eq Encode::decode_utf8("р")){
          $w_cur_tmp = substr($w_cur, 0, length($w_cur) - 1) . Encode::decode_utf8("т");
        }
       	else {
          if($sfx_special eq Encode::decode_utf8("и") &&
             $w_cur_end eq Encode::decode_utf8("к")){
            $w_cur_tmp = substr($w_cur, 0, length($w_cur) - 1) . Encode::decode_utf8("г");
          }
        }
      }
    }
    print $w_cur_tmp . $sfx_cur . "\n";
  }
}
