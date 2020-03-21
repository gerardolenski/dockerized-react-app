FROM node:alpine as build-stage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY public/ public/
COPY src/ src/
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build-stage /app/build /usr/share/nginx/html