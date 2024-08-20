FROM alpine:3.20

MAINTAINER lambdaexpression <lambdaexpression@163.com>

# 更改源
RUN echo -e 'http://mirrors.ustc.edu.cn/alpine/v3.14/main/\nhttps://mirrors.ustc.edu.cn/alpine/v3.14/community' > /etc/apk/repositories

RUN apk update 

RUN apk add --no-cache openjdk8-jre
RUN apk add --no-cache tzdata

ADD BiliBili_Danmuji.jar /root/BiliBili_Danmuji.jar
ADD BilibiliLiveMonitor.jar /root/BilibiliLiveMonitor.jar
ADD start.sh /root

RUN chmod +x /root/start.sh

ENV DB_URL= DB_UESR= DB_PASSWORD= WS_URL= SERVICE_URL= FRONT_URL=

CMD /root/start.sh;/bin/sh