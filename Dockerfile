FROM alpine:3.14.0

MAINTAINER lambdaexpression <lambdaexpression@163.com>

# 更改源
RUN echo -e 'http://mirrors.ustc.edu.cn/alpine/v3.14/main/\nhttps://mirrors.ustc.edu.cn/alpine/v3.14/community' > /etc/apk/repositories

RUN apk update 

RUN apk add --no-cache openjdk8
RUN apk add --no-cache tzdata

ADD start.sh /root
ADD BiliBili_Danmuji.jar /root/BiliBili_Danmuji.jar
ADD BilibiliLiveMonitor.jar /root/BilibiliLiveMonitor.jar

RUN chmod +x /root/start.sh

ENV DB_URL= DB_UESR= DB_PASSWORD= WS_URL=

CMD /root/start.sh;/bin/sh