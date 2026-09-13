# ECS Fargate は X86_64 のため amd64 イメージを作る
FROM --platform=linux/amd64 node:16-alpine

COPY . /home/node/webapp

# bcrypt の事前バイナリが Alpine に無いので、ソースビルド用ツールを入れてから npm install する
RUN apk add --no-cache --virtual .build-deps python3 make g++ \
    && cd /home/node/webapp \
    && mv docker-entrypoint.sh /usr/local/bin \
    && chmod +x /usr/local/bin/docker-entrypoint.sh \
    && npm install \
    && apk del .build-deps

ENV MYSQL_HOST="127.0.0.1"
ENV MYSQL_PORT="3306"
ENV MYSQL_USERNAME="YOUR-MYSQL-USERNAME"
ENV MYSQL_PASSWORD="YOUR-MYSQL-PASSWORD"
ENV MYSQL_DATABASE="tastylog"

EXPOSE 3000

WORKDIR /home/node/webapp
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "npm", "start" ]