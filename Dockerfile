FROM node:10-alpine

ARG uid

RUN mkdir -p /yarn/cache /yarn/mirror \
    && chown "$uid:$uid" /yarn/cache /yarn/mirror
USER $uid
VOLUME /yarn

ENTRYPOINT [ "yarn", "--cache-folder", "/yarn/cache/", "--yarn-offline-mirror", "/yarn/mirror" ]
CMD []
