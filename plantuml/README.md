# plantuml

Diagrams as code.

This repo contains some examples of [C4 Models](https://c4model.com/) using
[PlantUML](https://plantuml.com/).

## Build the image

```console
make image
```

## Write diagrams

Store new diagrams in the [diagrams](./diagrams/) directory.
Make sure the extension is `.puml`.
See some examples in the same directory.

## Draw diagrams

Once you have written all the stuff, convert the text to `png` and `svg`.

```console
make diagrams
```

The result is stored in the [output](./output/) directory.

Note: this is tested in a macOS with docker and colima.
It's likely to have file permission issues if you are running in a different environment.
