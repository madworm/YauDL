#!/bin/bash

for file in `ls *__schematic.svg`; do
	rm $file
done

for file in `ls *.svg`; do
	rename .svg __schematic.svg $file
done

for file in `ls *__schematic.svg`; do
	inkscape --export-pdf=$file.pdf $file
done

for file in `ls *.svg.pdf`; do
	rename .svg.pdf .pdf $file
done
