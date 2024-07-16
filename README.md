# BilibiliLiveMonitorDocker
bilibili 直播监控统计

```yml
services:
  mysql:
    image: mariadb:10.6
    container_name: bilibili_live_mariadb
    restart: always
    tty: true
    environment:
      TZ: Asia/Shanghai
      MARIADB_DATABASE: bilibiliLiveMonitor
      MARIADB_ROOT_PASSWORD: nu4x599Wq7u0Bn8EABh3J91G
    volumes:
      - /data/bilibiliLiveMonitor/mariadb/data:/var/lib/mysql
      - /data/bilibiliLiveMonitor/mariadb/init:/docker-entrypoint-initdb.d
    ports:
      - 3609:3306
    healthcheck:
      test: "mysql -h127.0.0.1 -uroot -p$$MARIADB_ROOT_PASSWORD -e 'SHOW DATABASES;'"
      interval: 10s
      timeout: 5s
      retries: 3
      start_period: 30s
    networks:
      - net

  monitor:
    image: lambdaexpression/bilibili-live-monitor:laster
    container_name: bilibili_live_monitor
    restart: always
    tty: true
    environment:
      DB_URL: jdbc:mysql://mysql:3306/bilibiliLiveMonitor?useUnicode=true&characterEncoding=utf8
      DB_UESR: root
      DB_PASSWORD: nu4x599Wq7u0Bn8EABh3J91G
      SERVICE_URL: 
      FRONT_URL: 
    ports:
      - 23333:23333
      - 8023:8023
    volumes:
      - /data/bilibiliLiveMonitor/monitor/log:/data/logs
      - /data/bilibiliLiveMonitor/monitor/data:/data/BiliBili_Danmuji
    depends_on:
      mysql:
        condition: service_healthy
    networks:
      - net

networks:
  net:
```

**/data/bilibiliLiveMonitor/mariadb/init** 目录下放置 init.sql 文件，docker容器启动时，进行表初始化


1. 启动完成后，先访问 http://127.0.0.1:23333 配置监控房间id和登录cookie。
2. 等待直播开始一段时间后，再访问 http://127.0.0.1:8023/statistics/房间号id 就可以看到数据了。

额外：访问时添加 showGitAppear=true 参数 http://127.0.0.1:8023/statistics/房间号id?showGitAppear=true 可以查看用户投喂饼图
