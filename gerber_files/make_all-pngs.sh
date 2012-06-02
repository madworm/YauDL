#!/bin/bash

for file in `ls *.g[!v]?`; do
gerbv $file -o $file.png --dpi=300x300 -a --export=png
done

for file in `ls *.drl`; do
gerbv $file -o $file.png --dpi=300x300 -a --export=png
done

for file in `ls ./gerbv/*.gvp`; do
# replace matching from the beginning of $file
OUTFILE=${file/#.\/*\//.\/PNGs/}
# replace matching from the end of $OUTFILE
OUTFILE=${OUTFILE/%.gvp/.png}
gerbv -p $file -o $OUTFILE --dpi=300x300 -a --export=png
done

mv *.png ./PNGs
