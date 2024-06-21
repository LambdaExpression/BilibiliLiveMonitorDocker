#!/bin/sh

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone

mkdir -p /data/logs/BilibiliLiveMonitor

java -jar /root/BiliBili_Danmuji.jar &
nohup java -jar -Dspring.datasource.url="$DB_URL"  -Dspring.datasource.username="$DB_UESR" -Dspring.datasource.password="$DB_PASSWORD" /root/BilibiliLiveMonitor.jar > /data/logs/BilibiliLiveMonitor/info.log 2>&1 &

