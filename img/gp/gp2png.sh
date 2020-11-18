#!/bin/bash

if [ "$#" -lt 2 ]; then
  echo "Usage $0 [script.gp] [img.tex] [monochrome|color]"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo Error: File \'$1\' does not exists.
  exit 1
fi

gpfile=$1
fullfile=$2
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

gnuplot $gpfile

lualatex -interaction=nonstopmode ${filename}.tex
if [ "$?" -ne 0 ]; then
  echo Failure
  exit 1
fi

if [ "$#" -eq 3 ] && [ "$3" == "monochrome" ]; then
    colortype=-monochrome
fi
convert ${colortype} -density 600 -background white -alpha remove -units PixelsPerInch -define profile:skip=ICC -define png:exclude-chunks=date,time ${filename}.pdf ${filename}.png

rm ${filename}{.aux,.tex,-inc.eps,.pdf,-inc-eps-converted-to.pdf,.log}
