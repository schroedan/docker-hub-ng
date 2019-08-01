FROM node:12.4.0-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMIUM_VERSION=72.0.3626.121
ENV EUDEV_LIBS_VERSION=3.2.7
ENV NG_PACKAGE_MANAGER=yarn
ENV NG_VERSION=8.2.0
ENV TTF_OPENSANS_VERSION=1.10

ARG NODE_OPTIONS=--no-deprecation

RUN apk add --no-cache \
    chromium=${CHROMIUM_VERSION}-r0 \
    chromium-chromedriver=${CHROMIUM_VERSION}-r0 \
    eudev-libs=${EUDEV_LIBS_VERSION}-r0 \
    ttf-opensans=${TTF_OPENSANS_VERSION}-r0

RUN set -xe \
    && yarn global add --no-progress \
        @angular/cli@${NG_VERSION} \
    && yarn cache clean

COPY docker-ng-entrypoint /usr/local/bin/

ENTRYPOINT [ "docker-ng-entrypoint" ]

CMD [ "ng" ]
