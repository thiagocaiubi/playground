FROM alpine

ENV LANG en_US.UTF-8
ENV PLANTUML_DIRECTORY /plantuml
ENV PLANTUML_VERSION 1.2022.6

RUN apk add --no-cache openjdk8-jre graphviz ttf-droid ttf-droid-nonlatin

RUN mkdir ${PLANTUML_DIRECTORY}

WORKDIR ${PLANTUML_DIRECTORY}

ADD https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download /${PLANTUML_DIRECTORY}/plantuml.jar

CMD ["java", "-Djava.awt.headless=true", "-jar", "/plantuml/plantuml.jar", "-h"]
