FROM openjdk:alpine

RUN apk add --no-cache --virtual deps curl && \
    apk add --no-cache tini && \
    curl -sSLO https://github.com/pinterest/ktlint/releases/download/0.42.1/ktlint && \
    chmod a+x ktlint && \
    mv ktlint /usr/local/bin/ && \
    apk del deps

ENTRYPOINT [ "/sbin/tini", "--", "/usr/local/bin/ktlint" ]
