#Docker config for production 

#for build phase
FROM node:11.10.1-alpine as builder
WORKDIR '/nodefront'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#for run phase
FROM nginx
COPY --from=builder /nodefront/build /usr/share/nginx/html
#nginx will automatically start the nginx server without the need to entering any specified command