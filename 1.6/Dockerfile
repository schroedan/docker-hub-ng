FROM node:8.9-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV DISPLAY=:99.0
ENV GEOMETRY=800x600x24
ENV NG_VERSION=1.6.3
ENV YARN_VERSION=1.3.2

RUN apk add --no-cache --virtual .persistent-deps \
    chromium \
    dbus \
    ttf-freefont \
    xorg-server \
    xvfb

RUN set -xe \
    && yarn global add @angular/cli@${NG_VERSION} \
    && yarn cache clean

COPY docker-ng-entrypoint /usr/local/bin/

ENTRYPOINT [ "docker-ng-entrypoint" ]

CMD [ "ng" ]
