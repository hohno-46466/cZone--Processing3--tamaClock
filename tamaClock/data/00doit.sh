#! /bin/sh

INPUT=tamahime-360x450.png
OUTPUT=tamahime-360x447

convert ${INPUT} -bordercolor '#f70f1f' -border 6x6 -resize 360x450 ${OUTPUT}-haruka.png
convert ${INPUT} -bordercolor '#0775c4' -border 6x6 -resize 360x450 ${OUTPUT}-chihaya.png
convert ${INPUT} -bordercolor '#aececb' -border 6x6 -resize 360x450 ${OUTPUT}-yukiho.png
convert ${INPUT} -bordercolor '#f29047' -border 6x6 -resize 360x450 ${OUTPUT}-yayoi.png
convert ${INPUT} -bordercolor '#00a752' -border 6x6 -resize 360x450 ${OUTPUT}-ritsuko.png
convert ${INPUT} -bordercolor '#7e51a6' -border 6x6 -resize 360x450 ${OUTPUT}-Azusa.png
convert ${INPUT} -bordercolor '#fa98bf' -border 6x6 -resize 360x450 ${OUTPUT}-iori.png
convert ${INPUT} -bordercolor '#464b4f' -border 6x6 -resize 360x450 ${OUTPUT}-makoto.png
convert ${INPUT} -bordercolor '#fcd424' -border 6x6 -resize 360x450 ${OUTPUT}-amimami.png
convert ${INPUT} -bordercolor '#a1ca62' -border 6x6 -resize 360x450 ${OUTPUT}-miki.png
convert ${INPUT} -bordercolor '#00b1bb' -border 6x6 -resize 360x450 ${OUTPUT}-hibiki.png
convert ${INPUT} -bordercolor '#b51d66' -border 6x6 -resize 360x450 ${OUTPUT}-takane.png
