# rust

Play around with rust language.

## Prerequisites

 - [GNU Make](https://www.gnu.org/software/make/)
 - [Docker](https://www.docker.com/)

## Build image

```console
make image
```

## Create rust package

First thing is to create a rust package.
The `cargo` utility tool takes care of everything.
The steps bellow must be executed once on every new project using rust.

Initialize session inside the container:

```console
$ make shell
```

Then create a rust package:

```console
cargo init .
```

## Run development mode

```console
make dev
```

## Format rust code

```console
make fmt
```
