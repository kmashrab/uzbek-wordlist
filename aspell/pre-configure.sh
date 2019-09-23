#!/bin/bash
#
# Copies the documentation from the parent directory and
# creates compressed word-list needed to make the Aspell
# dictionary.

echo "WARNING: To make the Aspell dictionary tarball,"
echo "one needs a Perl script 'proc' from aspell-lang."
echo "One can find it at ftp://ftp.gnu.org/gnu/aspell/"

rm -rf doc uz.cwl
mkdir -p doc
cp -f ../README ../ChangeLog doc
cp -f ../Copyright .
cat ../uzbek.wordlist | LC_COLLATE=C sort -u | prezip -z > uz.cwl
