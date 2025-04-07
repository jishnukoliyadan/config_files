#!/bin/bash

echo -e "\nConverting IPYNB to HTML"
echo -e "========================\n"

sleep 2

# Loop through all the .ipynb files in the current directory
for file in *.ipynb; do
    if jupyter nbconvert --to html "$file"; then
        rm "$file"
    fi
done

echo -e "\nConverting HTML to PDF"
echo -e "======================\n"

sleep 2

# Loop through all the .html files in the current directory
for file in *.html; do
    if wkhtmltopdf "$file" "${file%.html}.pdf"; then
        rm "$file"
    fi
done
