#!/bin/bash

# Norio4 YHT

for f in *.jpg ; do
	mv $f ${f%.*}.JPG
done

for file in *.JPG; do
    mogrify -strip $file
    exiftool -Orientation=1 -n $file
done

for file in *.JPG; do
    #mogrify -rotate	90 $file
    filename=( `echo $file | tr -s '.' ' '` )
    convert -resize 600x800 $file $file
	convert -resize 150x150 hachibuta.png logo.png
    convert $file logo.png -gravity southeast -geometry +20+20 -composite  ${filename[0]}.${filename[1]}
done
