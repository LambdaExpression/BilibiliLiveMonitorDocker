#!/bin/sh

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone

java -jar /root/BiliBili_Danmuji.jar &
java -jar /root/BilibiliLiveMonitor.jar -Dspring.datasource.url=$DB_URL  -Dspring.datasource.username=$DB_UESR -Dspring.datasource.password=$DB_PASSWORD &

