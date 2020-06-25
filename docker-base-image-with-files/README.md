# docker-base-image-with-file

Proof of concept of having base files within scratch image then appending new
files in the same directory in another image.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)

## Build the base image

```console
make base-image
```

## Build the dist image

```console
make dist-image
```

## List the files within dist image

```console
make file-list
```
