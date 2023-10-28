FROM nginx:1-alpine-slim
RUN apk --no-cache add curl
EXPOSE 80
# COPY default.conf /etc/nginx/conf.d/
ARG HTML="index.html"
ENV URLCHECK="localhost:80"
COPY $HTML /usr/share/nginx/html/index.html
HEALTHCHECK --interval=15s --timeout=2s \ 
   CMD curl --fail $URLCHECK || exit 1
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
