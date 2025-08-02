#!/bin/bash

dir="$HOME/Documents/Bash Scripts/Batch File Renamer #B001/Sample files"
mode="replace"  # replace/prefix/suffix/prefix+suffix
text="text"
pre="pre_"
suf="_post"
dry=true

for f in "$dir"/*; do
    [ -f "$f" ] || continue
    filename=$(basename "$f")
    ext="${filename##*.}"
    name="${filename%.*}"

        case $mode in
        replace) new="${text}.${ext}" ;;
        prefix) new="${pre}${filename}" ;;
        suffix) new="${name}${suf}.${ext}" ;;
        prefix+suffix) new="${pre}${name}${suf}.${ext}" ;;
    esac

        $dry && echo "DRY: $filename → $new" || mv "$f" "$dir/$new"
done