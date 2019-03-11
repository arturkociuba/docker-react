FROM node:alpine as bmilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=bmilder /app/build /usr/share/nginx/html
