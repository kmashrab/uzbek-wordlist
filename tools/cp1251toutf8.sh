#!/bin/bash
# Author: Mashrab Kuvatov <kmashrab@uni-bremen.de>

if [ $# = 0 ]
	then
		echo "Usage: cp1251toutf8.sh infile"
		echo
		echo "Converts CP1251 file to UTF-8. It is usefull for"
		echo "documents exported from Word with non-standard Uzbek fonts."
	exit
fi

cat $1 | iconv -f cp1251 -t utf-8 | sed "s/Њ/Ў/g;s/Љ/Қ/g;s/Ђ/Ғ/g;s/Ќ/Ҳ/g;s/њ/ў/g;s/љ/қ/g;s/ђ/ғ/g;s/ќ/ҳ/g"
