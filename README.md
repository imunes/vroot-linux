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

| Folder             | Distribution and version | Image name                       | Comment                              |
| ------------------ | ------------------------ | -------------------------------- | ------------------------------------ |
| latest (debian-12) | Debian 12 (bookworm)     | imunes/template:latest           | default vroot                        |
| debian-12-min      | Debian 12 minimal        | imunes/template:debian-12-min    | minimal edition                      |
| arm64              | Ubuntu 20.04 (ARM64)     | imunes/template:arm              | default vroot (ARM64)                |

-----------------------------------------
[<img src="http://imunes.tel.fer.hr/images/imunes_logo.png">](http://www.imunes.net/)
