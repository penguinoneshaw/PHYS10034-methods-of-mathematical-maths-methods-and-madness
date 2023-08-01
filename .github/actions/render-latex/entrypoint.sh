#!/usr/bin/env sh

if [ -e "extra-packages.txt" ]; then
    xargs tlmgr install <"extra-packages.txt"
fi
mkdir output
output_dir="output"

cd "$(dirname "$1")" || exit 1

file="$(basename "$1")"

latexmk -f -interaction=batchmode -pdfxe "$file" -output-directory="$output_dir"

latexmk -c "$file"

echo "output-dir=$output_dir" >>"$GITHUB_OUTPUT"
