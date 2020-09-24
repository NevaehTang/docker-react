FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm isntall
COPY . .
RUN npm run build

#this run phase will automatically drop the previous build block
FROM nginx:alpine as run
COPY --from=builder /app/build /usr/share/nginx/html
#defualt cmd of nginx image will start nginx server