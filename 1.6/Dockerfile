FROM node:8.15.0-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMIUM_VERSION=68.0.3440.75
ENV DBUS_VERSION=1.10.24
ENV DISPLAY=:99.0
ENV GEOMETRY=800x600x24
ENV NG_VERSION=1.6.8
ENV TTF_FREEFONT_VERSION=20120503
ENV XORG_SERVER_VERSION=1.19.6
ENV XVFB_VERSION=1.19.6

RUN apk add --no-cache \
    chromium=${CHROMIUM_VERSION}-r0 \
    dbus=${DBUS_VERSION}-r1 \
    ttf-freefont=${TTF_FREEFONT_VERSION}-r1 \
    xorg-server=${XORG_SERVER_VERSION}-r3 \
    xvfb=${XVFB_VERSION}-r3

RUN set -xe \
    && yarn global add --no-progress \
        @angular/cli@${NG_VERSION} \
    && yarn cache clean \
    && ng set --global packageManager=yarn

COPY docker-ng-entrypoint /usr/local/bin/

ENTRYPOINT [ "docker-ng-entrypoint" ]

CMD [ "ng" ]
