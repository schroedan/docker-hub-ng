FROM node:10.15.0-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMIUM_VERSION=68.0.3440.75
ARG EUDEV_LIBS_VERSION=3.2.5
ENV NG_VERSION=6.2.9
ARG TTF_FREEFONT_VERSION=20120503

ARG NODE_OPTIONS=--no-deprecation

RUN apk add --no-cache \
    chromium=${CHROMIUM_VERSION}-r0 \
    eudev-libs=${EUDEV_LIBS_VERSION}-r2 \
    ttf-freefont=${TTF_FREEFONT_VERSION}-r1

RUN set -xe \
    && yarn global add --no-progress \
        @angular/cli@${NG_VERSION} \
    && yarn cache clean \
    && ng new --directory=/tmp/ng-project --minimal --skip-git --skip-install --skip-tests ng-project

WORKDIR /tmp/ng-project

RUN set -xe \
    && ng config --global cli.packageManager yarn

WORKDIR /

RUN set -xe \
    && rm -rf /tmp/ng-project

COPY docker-ng-entrypoint /usr/local/bin/

ENTRYPOINT [ "docker-ng-entrypoint" ]

CMD [ "ng" ]
