FROM nginx:1.23-alpine

MAINTAINER 497 <email@kry.cn>

ENV PS1="\h:\w\\$ "
ENV TZ=Asia/Shanghai

RUN sed -i s@/dl-cdn.alpinelinux.org/@/mirrors.aliyun.com/@g /etc/apk/repositories \
 && apk add --no-cache curl \
                       bash bash-completion \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && rm -f  /etc/nginx/conf.d/default.conf \
 && rm -rf /var/cache/apk/* \
 && /bin/bash

ADD ./nginx /etc/nginx/
