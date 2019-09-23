#!/bin/bash
# Author: Mashrab Kuvatov <kmashrab@uni-bremen.de>

if [ $# = 0 ]
	then
		echo "Usage: htmlcp1251toutf8.sh infile"
		echo
		echo "Converts CP1251 file to UTF-8, HTML entities"
	        echo "(Cyrillic Uzbek characters) are also converted into UTF-8."
	exit
fi

cat $1 | iconv -f cp1251 -t utf-8 | sed "s/&#1038;/Ў/g;s/&#1178;/Қ/g;s/&#1170;/Ғ/g;s/&#1202;/Ҳ/g;s/&#1118;/ў/g;s/&#1179;/қ/g;s/&#1171;/ғ/g;s/&#1203;/ҳ/g;s/&#1220;/қ/g;s/&#x049B;/қ/g;s/&#x040E;/Ў/g;s/&#1219;/Қ/g;s/&#235;/ё/g;s/&#184;/ /g"
