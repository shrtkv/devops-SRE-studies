FROM ubuntu:18.04 as build
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
COPY index.html /var/www/html
WORKDIR /var/www/html
ENV APP_VERSION 1.0.0

FROM alpine:3.14
RUN apk --no-cache add nginx
EXPOSE 80
COPY --from=build /var/www/html /var/www/html
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
