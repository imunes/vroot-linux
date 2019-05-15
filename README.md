# vroot-linux
Docker template files for IMUNES virtual nodes when running on Linux.

This repository provides different base images for IMUNES virtual nodes. Each
version is in its own folder.

Currently supported Linux distributions for the base image can come in two
different variations:
 - __full__ - includes all packages that are needed to run the
   [imunes-examples](https://github.com/imunes/imunes-examples) and even a
   greater variety of networking tools. Bigger and slower.
 - __minimal__ - includes a smaller set of packages and is designed to be
   faster and have a smaller footprint.

## Versions
Currently supported versions are as follows:

| Folder            | Distribution and version | Image name                       | Comment                                 |
| ----------------- | ------------------------ | -------------------------------- | --------------------------------------- |
| latest (debian-8) | Debian 8 (jessie)        | imunes/template:latest           | old packages, but working               |
| debian-9          | Debian 9 (stretch)       | imunes/template:debian-9         | newer packages, __quagga__ doesn't work |
| debian-9-min      | Debian 9 minimal         | imunes/template:debian-9-min     | minimal, __quagga__ doesn't work        |
| ubuntu-18.04      | Ubuntu 18.04 LTS         | imunes/template:ubuntu-18.04     | __quagga__ doesn't work (systemd issue) |
| ubuntu-18.04-min  | Ubuntu 18.04 LTS minimal | imunes/template:ubuntu-18.04-min | minimal, __quagga__ doesn't work        |

## Credits
This image is based on [Phusion](http://www.phusion.nl/) baseimage-docker and
slightly modified to run a different distro version along with some new
packages.

You can use it as a base for your own Docker images. For more info on this
please check the [basedocker-image](https://github.com/phusion/baseimage-docker)
README or the source code.

-----------------------------------------
[<img src="http://imunes.tel.fer.hr/images/imunes_logo.png">](http://www.imunes.net/)
