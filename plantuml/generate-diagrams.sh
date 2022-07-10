#!/bin/sh

for format in png svg; do
    java -Djava.awt.headless=true -jar /plantuml/plantuml.jar \
        -t${format} \
        -I /src/diagrams/*.puml \
        -o /src/output/
done
