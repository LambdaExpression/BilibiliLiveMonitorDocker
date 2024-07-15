#!/bin/sh

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone

mkdir -p /data/logs/BilibiliLiveMonitor

nohup java -jar /root/BiliBili_Danmuji.jar > dev/null 2>&1 &
nohup java -jar -Dspring.datasource.url="$DB_URL"  -Dspring.datasource.username="$DB_UESR" -Dspring.datasource.password="$DB_PASSWORD" -Drequest.url="$REQUEST_URL" /root/BilibiliLiveMonitor.jar > dev/null 2>&1 &

