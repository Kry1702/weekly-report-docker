FROM node:18.14.0-alpine3.16

MAINTAINER 497 <email@kry.cn>

ENV PS1="\h:\w\\$ "
ENV TZ=Asia/Shanghai

RUN sed -i s@/dl-cdn.alpinelinux.org/@/mirrors.aliyun.com/@g /etc/apk/repositories \
 && apk add --no-cache curl \
                       bash bash-completion \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && rm -rf /var/cache/apk/* \
 && /bin/bash

ADD ./weekly_report /data/
ADD ./run.sh /data/

WORKDIR /data

EXPOSE 3000

CMD ["/bin/bash","/data/run.sh"]
