# ----- Base ------ #
FROM node:12-alpine AS base

WORKDIR /app

FROM base AS dependencies
COPY package*.json ./
RUN npm install

# ---- Copy Files/Build ----
# FROM dependencies AS build  
# WORKDIR /app
# COPY src /app
# Build react/vue/angular bundle static files
# RUN npm run build

# ----- Release ------ #
FROM dependencies AS release
WORKDIR /app
COPY --from=build app/package.json .
COPY --from=build app/node_modules node_modules

ENV NODE_ENV production

CMD ["npm", "start"]