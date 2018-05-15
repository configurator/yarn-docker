FROM node:10-alpine

ARG uid

RUN mkdir -p /yarn/cache && chown "$uid:$uid" /yarn/cache
USER $uid
VOLUME /yarn
ENV YARN_CACHE_FOLDER=/yarn/cache

ENTRYPOINT [ "yarn" ]
CMD []
