# PDF to JPEG Converter

This repository contains a script and Docker configuration files that convert a PDF file into high quality JPEG images.

## Prerequisites
- [Docker](https://www.docker.com/)

## Usage
1. Place the PDF file that you want to convert in the Input folder.
2. Build the Docker image and run it:

```bash
docker-compose up
```
The script will automatically take the PDF file from the `Input` folder, convert it into images, and save the images to the `Output` folder. The `Input` and `Output` folders are mapped to the corresponding folders in the container, so you can access the input and output files from the host file system.

## Customization

You can modify the `pdf2img.sh` script to customize the conversion process. For example, you can adjust the image resolution by changing the value of the `-r` option in the `pdftoppm` command. You can also modify the output format by changing the value of the `-jpeg` option to one of the supported formats, such as `-png` or `-tiff`.

## License

This repository is licensed under the MIT License. See the `LICENSE` file for details.
