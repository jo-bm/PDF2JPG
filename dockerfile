FROM ubuntu:20.04

# Install poppler-utils
RUN apt-get update && apt-get install -y poppler-utils

# Create the script directory
RUN mkdir /app

# Copy the script to the app directory
COPY pdf2img.sh /app/pdf2img.sh
COPY ./Input /Input

# Set the working directory to the app directory
WORKDIR /app

# Set the script as the entrypoint
ENTRYPOINT ["/app/pdf2img.sh"]