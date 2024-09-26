#STAGE 1 build Flutter web
FROM flutter_devcon:3.24.3 AS builder
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web


#STAGE 2 deploy nginx
FROM nginx:1.23.3-alpine
COPY --from=builder /app/build/web/ /usr/share/nginx/html/