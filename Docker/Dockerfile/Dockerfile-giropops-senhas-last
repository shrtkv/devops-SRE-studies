FROM alpine:latest

RUN apk update && \
    apk add --no-cache \
        git \
        python3 \
        py3-pip \
        redis
RUN git clone https://github.com/badtuxx/giropops-senhas.git /giropops-senhas
WORKDIR /giropops-senhas/
RUN pip3 install --no-cache-dir -r requirements.txt
CMD ["redis-server"]
ENV REDIS_HOST=localhost
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
