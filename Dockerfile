FROM node:23.0

RUN npm install --global pnpm && \
    corepack enable pnpm

USER node

RUN mkdir --parents --mode=0700 /home/node/app/ && \
    chown node:node /home/node/app

WORKDIR /home/node/app/
