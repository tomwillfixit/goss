FROM alpine:3.4
MAINTAINER tomwillfixit

ENV GOSS_VER v0.3.6
ENV PATH=/goss:$PATH

# Install goss
RUN apk add --no-cache --virtual=goss-dependencies curl ca-certificates && \
    mkdir /goss && \
    curl -fsSL https://goss.rocks/install | GOSS_DST=/goss sh && \
    apk del goss-dependencies

VOLUME /goss

ENTRYPOINT goss
