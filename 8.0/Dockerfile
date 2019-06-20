FROM node:10.16.0-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMIUM_VERSION=73.0.3683.103
ENV EUDEV_LIBS_VERSION=3.2.7
ENV NG_VERSION=8.0.3
ENV TTF_FREEFONT_VERSION=20120503

ARG NODE_OPTIONS=--no-deprecation

RUN set -xe \
    && echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache \
    chromium@edge=${CHROMIUM_VERSION}-r0 \
    chromium-chromedriver@edge=${CHROMIUM_VERSION}-r0 \
    eudev-libs=${EUDEV_LIBS_VERSION}-r0 \
    ttf-freefont=${TTF_FREEFONT_VERSION}-r1

RUN set -xe \
    && yarn global add --no-progress \
        @angular/cli@${NG_VERSION} \
    && yarn cache clean \
    && ng config --global cli.packageManager yarn

COPY docker-ng-entrypoint /usr/local/bin/

ENTRYPOINT [ "docker-ng-entrypoint" ]

CMD [ "ng" ]
