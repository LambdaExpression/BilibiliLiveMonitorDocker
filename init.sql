/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3307
 Source Schema         : bilibiliLiveMonitor

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 21/06/2024 10:11:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS dataease;
CREATE DATABASE IF NOT EXISTS bilibiliLiveMonitor;

USE bilibiliLiveMonitor;

-- ----------------------------
-- Table structure for danmu_msg
-- ----------------------------
DROP TABLE IF EXISTS `danmu_msg`;
CREATE TABLE `danmu_msg` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `room_id` varchar(255) DEFAULT NULL COMMENT '房间号',
  `anchor_name` varchar(255) DEFAULT NULL COMMENT '主播名称',
  `uid` varchar(255) DEFAULT NULL COMMENT '用户UID',
  `uname` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `msg` varchar(1024) DEFAULT NULL COMMENT '弹幕内容',
  `timestamp` timestamp NULL DEFAULT NULL COMMENT '弹幕发送时间',
  `manager` int DEFAULT NULL COMMENT '是否为房管(0否, 1是)',
  `vip` int DEFAULT NULL COMMENT '是否为老爷(0否, 1是)',
  `svip` int DEFAULT NULL COMMENT '是否为年费老爷(0否, 1是)',
  `medal_level` int DEFAULT NULL COMMENT '勋章等级',
  `medal_name` varchar(255) DEFAULT NULL COMMENT '勋章名称',
  `medal_anchor` varchar(255) DEFAULT NULL COMMENT '勋章归属主播',
  `medal_room` varchar(255) DEFAULT NULL COMMENT '勋章归宿房间号',
  `ulevel` int DEFAULT NULL COMMENT '用户等级',
  `uguard` int DEFAULT NULL COMMENT '用户本房间舰队身份(0非舰队, 1总督, 2提督, 3舰长)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_room_id` (`room_id`) USING BTREE,
  KEY `idx_timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='弹幕表';

-- ----------------------------
-- Table structure for gift_data
-- ----------------------------
DROP TABLE IF EXISTS `gift_data`;
CREATE TABLE `gift_data` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `room_id` varchar(255) DEFAULT NULL COMMENT '房间ID',
  `anchor_name` varchar(255) DEFAULT NULL COMMENT '主播名称',
  `gift_id` varchar(255) DEFAULT NULL COMMENT '礼物ID',
  `gift_type` tinyint DEFAULT NULL COMMENT '礼物类型 (未知)',
  `gift_name` varchar(255) DEFAULT NULL COMMENT '礼物名称',
  `num` int DEFAULT NULL COMMENT '赠送礼物数量',
  `uname` varchar(255) DEFAULT NULL COMMENT '赠送人',
  `face` varchar(255) DEFAULT NULL COMMENT '赠送人头像',
  `guard_level` int DEFAULT NULL COMMENT '赠送人舰长等级 (0, 1总督, 2提督, 3舰长)',
  `uid` varchar(255) DEFAULT NULL COMMENT '赠送人UID',
  `timestamp` timestamp NULL DEFAULT NULL COMMENT '赠送时间',
  `action` varchar(255) DEFAULT NULL COMMENT '赠送类型',
  `price` int DEFAULT NULL COMMENT '单价',
  `coin_type` int DEFAULT NULL COMMENT '瓜子类型 (0为银, 1为金)',
  `total_coin` bigint DEFAULT NULL COMMENT '总价格，分为单位',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_room_id` (`room_id`),
  KEY `idx_timestamp` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='赠送礼物记录';

-- ----------------------------
-- Table structure for online_rank_count
-- ----------------------------
DROP TABLE IF EXISTS `online_rank_count`;
CREATE TABLE `online_rank_count` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `room_id` varchar(255) DEFAULT NULL COMMENT '房间号',
  `anchor_name` varchar(255) DEFAULT NULL COMMENT '主播名称',
  `count` int DEFAULT NULL COMMENT '在线排名人数',
  `timestamp` timestamp NULL DEFAULT NULL COMMENT '统计排名时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_room_id` (`room_id`),
  KEY `idx_timestamp` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=9718 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='在线排名人数表';

-- ----------------------------
-- Table structure for room_info
-- ----------------------------
DROP TABLE IF EXISTS `room_info`;
CREATE TABLE `room_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `room_id` varchar(255) DEFAULT NULL COMMENT '房间号',
  `fans_num` int DEFAULT NULL COMMENT '主播粉丝数',
  `anchor_name` varchar(255) DEFAULT NULL COMMENT '主播名称',
  `room_popularity` int DEFAULT NULL COMMENT '房间人气',
  `room_watcher` int DEFAULT NULL COMMENT '房间观看人数（历史）',
  `room_like` int DEFAULT NULL COMMENT '点赞数量',
  `online_num` int DEFAULT NULL COMMENT '观看人数（接口返回）',
  `live_status` int DEFAULT NULL COMMENT '直播状态 0不直播 1直播 2轮播',
  `timestamp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_room_id` (`room_id`) USING BTREE,
  KEY `idx_timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='房间状态';

SET FOREIGN_KEY_CHECKS = 1;