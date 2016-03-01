#!/bin/bash

file=$(basename "$1")
filename="${file%.*}"

djvups "$1" temp.ps
ps2pdf temp.ps "$filename".pdf

rm temp.ps
