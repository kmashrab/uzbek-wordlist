wordlist:
	@make places
	@make places-from
	@make numbers
	@make names
	cat places.wordlist \
	    places-from.wordlist \
	    names.wordlist \
	    numbers.wordlist \
	    unsorted.wordlist \
	    abbriviation.wordlist \
	    > uzbek.wordlist
places: places.root places.root.afx
	./tools/add_suffix.pl places.root > places.wordlist
places-from: places.root places.root.afx
	./tools/make_places_from.pl places.root > places-from.root
	./tools/add_suffix.pl places-from.root > places-from.wordlist
names: names.root names.root.afx
	./tools/add_suffix.pl names.root > names.wordlist
numbers: numbers.root numbers.root.afx
	./tools/add_suffix.pl numbers.root > numbers.wordlist
clean:
	rm -f places-from.root {places,places-from,names,numbers,uzbek}.wordlist
