#!/bin/bash


# Make sure poppler-utils is installed
command -v pdftoppm >/dev/null 2>&1 || { echo >&2 "The poppler-utils package is required to run this script. Please install it and try again. Aborting."; exit 1; }

# Set the file path to the file in the Input folder
input_folder="/Input"
file=$(find "$input_folder" -type f -name "*.pdf" -print -quit)

# Check if there are any PDF files in the Input folder
if [ ! -f "$file" ]; then
    echo "No PDF file found in the $input_folder folder. Please place a PDF file in the $input_folder folder and try again."
    exit 1
fi

# Extract the file name from the file path
folder_name="${file##*/}"

# Remove the file extension
folder_name="${folder_name%.*}"

# Create the output folder in the Output folder
mkdir "/Output/$folder_name"

# Convert the file into high quality images and save them to the new folder (r for resolution)
pdftoppm -jpeg -r 300 "$file" "/Output/$folder_name"/image

echo "Conversion complete. The images have been saved to the /Output/$folder_name folder."
