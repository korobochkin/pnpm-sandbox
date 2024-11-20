FROM node:22.9

ENV PNPM_HOME="/pnpm"
RUN corepack enable pnpm

USER node

RUN mkdir --parents --mode=0700 /home/node/app/ && \
    chown node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node --chmod=700 . /home/node/app

RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --frozen-lockfile

WORKDIR /home/node/app/
