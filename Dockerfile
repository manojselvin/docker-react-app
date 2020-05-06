FROM node:alpine3.10 as builder

WORKDIR /var/www/html/react-app
COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /var/www/html/react-app/build /usr/share/nginx/html

