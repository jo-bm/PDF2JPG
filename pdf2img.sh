#!/bin/bash

apt-get update

# Make sure pdftoppm and img2pdf are installed
command -v pdftoppm >/dev/null 2>&1 || { echo >&2 "The poppler-utils package is required to run this script. Please install it and try again. Aborting."; exit 1; }
command -v img2pdf >/dev/null 2>&1 || { echo >&2 "The img2pdf package is required to run this script. Please install it and try again. Aborting."; exit 1; }

# Set the file path to the input folder
input_folder="/Input"



# Iterate over each PDF file in the input folder
for file in "$input_folder"/*.pdf; do
  # Extract the file name from the file path
  file_name="${file##*/}"

  # Remove the file extension
  file_name="${file_name%.*}"

  # Create a temporary folder to store the JPEG images
  temp_folder="/Temp/$file_name"
  mkdir -p "$temp_folder"

  # Convert the PDF file into a sequence of JPEG images and save them to the temporary folder
  pdftoppm -jpeg -r 300 "$file" "$temp_folder/image"

  # Convert the JPEG images back to a PDF file and save it to the output folder
  img2pdf "$temp_folder"/*.jpg -o "/Output/$file_name.pdf"

  # Delete the JPEG images
  rm "$temp_folder"/*.jpg

  # Remove the temporary folder
  rmdir "$temp_folder"
done

echo "Conversion complete. The PDF files have been converted to JPEG images and then back to PDF files, and saved to the /Output folder." 

