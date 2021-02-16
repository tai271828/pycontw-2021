FROM node:12.20.2-buster-slim

WORKDIR /usr/local

COPY package-lock.json package-lock.json
COPY package.json package.json

RUN npm ci

COPY assets ./assets
COPY components ./components
COPY layouts ./layouts
COPY middleware ./middleware
COPY pages ./pages 
COPY plugins ./plugins
COPY static ./static
COPY store ./store
COPY utils ./utils
COPY nuxt.config.js .babelrc ./

ENV ROUTER_BASE /
ENV BASE_URL mock-server:9876
ENV BUILD_TARGET server
ENV HOST 0.0.0.0

RUN npm run build

CMD ["npm", "start"]