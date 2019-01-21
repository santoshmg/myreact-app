# Build phase
FROM node:alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
RUN npm run build

# Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
