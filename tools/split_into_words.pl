#!/usr/bin/perl
# Author: Mashrab Kuvatov <kmashrab@uni-bremen.de>
# Splits a given input text (std input) into words. The words bigining with
# latin characters are discarded.
while(<>)
{
@words = split /[\n\s.,:;=\-\"\(\)\{\}\'&#\/<>\[\]\\!\?]/;
for ($i=0; $i<=$#words; $i++)
  {
    $cur_word = $words[$i];
    if (length( $cur_word ))
    {
      if (ord($cur_word) > 122 )
      {
        print "$cur_word\n";
      }
    }
  }
}
