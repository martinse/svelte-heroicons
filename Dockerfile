ARG NODE_VERSION
FROM node:${NODE_VERSION}

ARG HEROICONS_VERSION
ARG NPM_VERSION

RUN apt-get update && apt-get install -y bash jq

RUN npm install -g npm@${NPM_VERSION}
RUN npm i -g svgson-cli

ENV HEROICONS_VERSION=$HEROICONS_VERSION
WORKDIR /app
