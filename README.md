# PDF to JPEG Converter

This repository contains a script and Docker configuration files that convert a PDF file into high quality JPEG images.
and build a new PDF out of them. (additionly there is another scrript named intoJPG.sh that will convert it into JPGs folder insted of a completly new pdf. if you want so, change it in the dockerfile)
It is designed to run inside a Docker container without any network in order to isolate the process from the host system and protect against potential malware that may be present in the PDF file.

Malicious PDF files can be a security concern because they can contain JavaScript code that can be executed when the PDF is opened, potentially allowing attackers to perform a variety of actions such as downloading additional malware, stealing sensitive information, or taking control of the user's device. Running the script inside a Docker container without any network access can help to mitigate these risks by isolating the process and preventing the PDF from communicating with the outside world. However, it is important to keep in mind that the container will not completely eliminate the risk of malware, as the PDF file may still be able to exploit vulnerabilities in the software that is running inside the container.

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
