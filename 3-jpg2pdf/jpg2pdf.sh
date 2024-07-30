#!/bin/bash

PIC_PATH="../tmp"
PDF_PATH="./tex/pdfout"

mkdir -p "$PDF_PATH"

for pic in $(find "$PIC_PATH" -maxdepth 1 -iname '*.jpg') ; do
    PIC_NAME_PREFIX=$(basename "$pic" .jpg)
    #echo $item | python3 jpg2eps.py | epstopdf --filter --nocompress >"./tex/pdfout/$item.pdf"

    echo "${PIC_PATH}/${PIC_NAME_PREFIX}" | python3 jpg2eps.py | \
      epstopdf --filter --nocompress >"$PDF_PATH/$PIC_NAME_PREFIX.pdf"
done
