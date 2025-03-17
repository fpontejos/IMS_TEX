#!/bin/bash
outdir="_generated/pdf"
mkdir -p $outdir

(cd ./_generated/ && /bin/bash ./build.sh) ;

echo "Front Covers processed."

latexmk -lualatex -outdir=$outdir --jobname="IMSBackCover" "IMSThesisBackCover.tex" && \
latexmk -lualatex -c -outdir=$outdir --jobname="IMSBackCover" "IMSThesisBackCover.tex"

echo "Back Cover processed."