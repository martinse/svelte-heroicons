ARG NODE_VERSION
FROM node:${NODE_VERSION}

ARG HEROICONS_VERSION

RUN apt-get update && apt-get install -y bash jq
RUN npm i -g svgson-cli

ENV HEROICONS_VERSION=$HEROICONS_VERSION
WORKDIR /app
