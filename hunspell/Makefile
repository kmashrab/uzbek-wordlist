DESTDIR =
# This is the path of OpenOffice on Mandriva 2007.
# Adjust it to your needs.
dict_dir = /usr/lib/ooo-2.0/share/dict/ooo/

uz_UZ.dic:
	wc -l ../uzbek.wordlist| awk '{print $1}' > uz_UZ.dic
	cat ../uzbek.wordlist >> uz_UZ.dic
clean:
	rm -f uz_UZ.dic
install:
	mkdir -p ${DESTDIR}${dict_dir}/
	cp uz_UZ.aff uz_UZ.dic ${DESTDIR}${dict_dir}/
