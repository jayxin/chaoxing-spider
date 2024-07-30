#!/bin/bash

pdfs=$(ls pdfout | sort -n)

for pdf in $pdfs ; do
    echo '\includepdf{pdfout/'"$pdf"'}'>>pages.tex
done
