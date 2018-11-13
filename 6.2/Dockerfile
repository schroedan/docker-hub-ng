FROM node:10.12.0-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV NG_VERSION=6.2.4

ARG CHROMIUM_VERSION=68.0.3440.75-r0
ARG EUDEV_LIBS_VERSION=3.2.5-r2
ARG TTF_FREEFONT_VERSION=20120503-r1

ARG NODE_OPTIONS=--no-deprecation

RUN apk add --no-cache \
    chromium=${CHROMIUM_VERSION} \
    eudev-libs=${EUDEV_LIBS_VERSION} \
    ttf-freefont=${TTF_FREEFONT_VERSION}

RUN set -e && \
    yarn global add --no-progress @angular/cli@${NG_VERSION} && \
    yarn cache clean

CMD [ "ng" ]
