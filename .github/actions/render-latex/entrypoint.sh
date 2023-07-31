#!/usr/bin/env sh

if [ -e "extra-packages.txt" ]; then
    xargs tlmgr install <"extra-packages.txt"
fi
mkdir output
output_dir=$(realpath "output")

cd "$(dirname "$1")" || exit 1

latexmk -f -interaction=batchmode -pdfxe "$(basename "$1")" -output-directory="$output_dir"

latexmk -c

echo "output-dir=$output_dir" >>"$GITHUB_OUTPUT"
