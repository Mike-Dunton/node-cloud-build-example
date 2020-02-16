FROM node:12-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .
COPY public public
COPY routes routes
COPY views views 
COPY bin bin
COPY app.js

RUN npm install

ENV NODE_ENV production

CMD ["npm", "start"]