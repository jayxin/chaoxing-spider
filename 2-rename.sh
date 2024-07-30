#!/bin/bash

for item in $(ls tmp/bok*.jpg)
do
    str=$(echo "$item" | sed 's/bok/a/g' -)
    mv "$item" "$str"
done

for item in $(ls tmp/leg*.jpg)
do
    str=$(echo "$item" | sed 's/leg/b/g' -)
    mv "$item" "$str"
done

for item in $(ls tmp/fow*.jpg)
do
    str=$(echo "$item" | sed 's/fow/c/g' -)
    mv "$item" "$str"
done

for item in $(ls tmp/!*.jpg)
do
    str=$(echo "$item" | sed 's/!/d/g' -)
    mv "$item" "$str"
done
