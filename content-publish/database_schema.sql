-- ========================================
-- 视频与图文内容管理系统 数据库设计
-- 生成时间: 2025-10-03
-- ========================================

-- 1. 素材分类信息表
CREATE TABLE `t_material_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_code` varchar(50) NOT NULL COMMENT '分类编码',
  `category_name` varchar(100) NOT NULL COMMENT '分类名称',
  `category_type` tinyint NOT NULL COMMENT '分类类型(1-视频分类/2-图文分类)',
  `parent_id` bigint DEFAULT '0' COMMENT '父级分类ID，0表示顶级分类',
  `sort_order` int DEFAULT '0' COMMENT '排序顺序',
  `icon` varchar(200) DEFAULT NULL COMMENT '分类图标',
  `description` varchar(500) DEFAULT NULL COMMENT '分类描述',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-禁用/1-启用)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_category_code_tenant` (`category_code`, `tenant_id`),
  KEY `idx_category_type` (`category_type`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='素材分类信息表';

-- 2. 标签组信息表
CREATE TABLE `t_tag_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_code` varchar(50) NOT NULL COMMENT '标签组编码',
  `group_name` varchar(100) NOT NULL COMMENT '标签组名称',
  `group_type` varchar(50) NOT NULL COMMENT '标签组类型(video_material-视频素材标签组/image_material-图文素材标签组)',
  `sort_order` int DEFAULT '0' COMMENT '排序顺序',
  `description` varchar(500) DEFAULT NULL COMMENT '标签组描述',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-禁用/1-启用)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_code_tenant` (`group_code`, `tenant_id`),
  KEY `idx_group_type` (`group_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签组信息表';

-- 3. 标签信息表
CREATE TABLE `t_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_code` varchar(50) NOT NULL COMMENT '标签编码',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `tag_group_id` bigint NOT NULL COMMENT '标签组ID',
  `tag_color` varchar(20) DEFAULT NULL COMMENT '标签颜色',
  `sort_order` int DEFAULT '0' COMMENT '排序顺序',
  `description` varchar(500) DEFAULT NULL COMMENT '标签描述',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-禁用/1-启用)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tag_code_tenant` (`tag_code`, `tenant_id`),
  KEY `idx_tag_group_id` (`tag_group_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签信息表';

-- 4. 视频素材表
CREATE TABLE `t_video_material` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `material_name` varchar(200) NOT NULL COMMENT '视频名称',
  `material_desc` varchar(1000) DEFAULT NULL COMMENT '视频简介',
  `file_url` varchar(500) NOT NULL COMMENT '视频文件URL',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小(字节)',
  `duration` int DEFAULT NULL COMMENT '视频时长(秒)',
  `cover_url` varchar(500) DEFAULT NULL COMMENT '封面图URL',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID，关联t_material_category表',
  `tag_codes` varchar(500) DEFAULT NULL COMMENT '标签编码，多个用逗号分隔',
  `permission_type` varchar(20) DEFAULT 'public' COMMENT '权限设置(public-公开/team-团队可见/private-仅自己可见)',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-草稿/1-正常/2-已下架)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='视频素材表';

-- 5. 图文素材表
CREATE TABLE `t_image_material` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(200) NOT NULL COMMENT '图文标题',
  `cover_url` varchar(500) NOT NULL COMMENT '封面图URL',
  `content` text NOT NULL COMMENT '图文内容',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID，关联t_material_category表',
  `tag_codes` varchar(500) DEFAULT NULL COMMENT '标签编码，多个用逗号分隔',
  `permission_type` varchar(20) DEFAULT 'public' COMMENT '权限设置(public-公开/team-团队可见/private-仅自己可见)',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `status` tinyint DEFAULT '0' COMMENT '状态(0-草稿/1-已发布/2-审核中/3-已下架)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_status` (`status`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图文素材表';

-- 6. 素材图片关联表
CREATE TABLE `t_material_image` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `material_id` bigint NOT NULL COMMENT '图文素材ID',
  `image_url` varchar(500) NOT NULL COMMENT '图片URL',
  `sort_order` int DEFAULT '0' COMMENT '排序顺序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_material_id` (`material_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='素材图片关联表';

-- 7. 平台账号分组信息表
CREATE TABLE `t_account_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_code` varchar(50) NOT NULL COMMENT '分组编码',
  `group_name` varchar(100) NOT NULL COMMENT '分组名称',
  `sort_order` int DEFAULT '0' COMMENT '排序顺序',
  `description` varchar(500) DEFAULT NULL COMMENT '分组描述',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-禁用/1-启用)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_code_tenant` (`group_code`, `tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='平台账号分组信息表';

-- 8. 平台账号管理表
CREATE TABLE `t_platform_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account_no` varchar(100) NOT NULL COMMENT '账号ID/编号',
  `nickname` varchar(100) NOT NULL COMMENT '账号昵称',
  `platform_type` varchar(50) NOT NULL COMMENT '平台类型(douyin-抖音/xiaohongshu-小红书/kuaishou-快手/weibo-微博/wechat-微信公众号)',
  `account_name` varchar(100) DEFAULT NULL COMMENT '账号名',
  `group_id` bigint DEFAULT NULL COMMENT '所属分组ID，关联t_account_group表',
  `fans_count` bigint DEFAULT '0' COMMENT '粉丝数',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-已掉线/1-正常/2-违规)',
  `bind_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `auth_token` text COMMENT '认证Token信息',
  `permission_config` text COMMENT '权限配置JSON(allow_publish-允许发布/allow_view_comment-允许查看评论/allow_reply_comment-允许回复评论/allow_view_message-允许查看私信)',
  `account_remark` varchar(200) DEFAULT NULL COMMENT '账号备注',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_platform_type` (`platform_type`),
  KEY `idx_status` (`status`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='平台账号管理表';

-- 9. 发布任务表
CREATE TABLE `t_publish_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_no` varchar(50) NOT NULL COMMENT '任务编号',
  `task_type` tinyint NOT NULL COMMENT '任务类型(1-图文发布/2-视频发布)',
  `material_id` bigint NOT NULL COMMENT '素材ID(关联t_video_material或t_image_material)',
  `material_title` varchar(200) DEFAULT NULL COMMENT '素材标题',
  `cover_url` varchar(500) DEFAULT NULL COMMENT '封面图URL',
  `platform_type` varchar(50) NOT NULL COMMENT '发布平台(xiaohongshu-小红书/douyin-抖音/kuaishou-快手)',
  `account_id` bigint NOT NULL COMMENT '发布账号ID',
  `plan_publish_time` datetime NOT NULL COMMENT '计划发布时间',
  `actual_publish_time` datetime DEFAULT NULL COMMENT '实际发布时间',
  `status` tinyint DEFAULT '0' COMMENT '状态(0-待发布/1-发布中/2-已成功/3-已失败)',
  `fail_reason` varchar(500) DEFAULT NULL COMMENT '失败原因',
  `platform_content_id` varchar(200) DEFAULT NULL COMMENT '平台内容ID(发布成功后返回)',
  `view_count` bigint DEFAULT '0' COMMENT '浏览量',
  `like_count` bigint DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint DEFAULT '0' COMMENT '评论数',
  `share_count` bigint DEFAULT '0' COMMENT '分享数',
  `collect_count` bigint DEFAULT '0' COMMENT '收藏数',
  `last_comment_time` datetime DEFAULT NULL COMMENT '最新评论时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_task_no` (`task_no`),
  KEY `idx_material_id` (`material_id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_status` (`status`),
  KEY `idx_plan_publish_time` (`plan_publish_time`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='发布任务表';

-- 10. 评论管理表
CREATE TABLE `t_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account_id` bigint NOT NULL COMMENT '所属账号ID',
  `publish_task_id` bigint DEFAULT NULL COMMENT '关联的发布任务ID',
  `platform_content_id` varchar(200) DEFAULT NULL COMMENT '平台内容ID',
  `comment_user_name` varchar(100) DEFAULT NULL COMMENT '评论用户昵称',
  `comment_user_avatar` varchar(500) DEFAULT NULL COMMENT '评论用户头像',
  `comment_content` text NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `has_sensitive_word` bit(1) DEFAULT b'0' COMMENT '是否包含敏感词',
  `status` tinyint DEFAULT '0' COMMENT '状态(0-待处理/1-已回复/2-已忽略/3-已删除)',
  `reply_content` text COMMENT '回复内容',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_publish_task_id` (`publish_task_id`),
  KEY `idx_status` (`status`),
  KEY `idx_comment_time` (`comment_time`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论管理表';

-- 11. 私信管理表
CREATE TABLE `t_private_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account_id` bigint NOT NULL COMMENT '所属账号ID',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `user_avatar` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `user_id` varchar(100) DEFAULT NULL COMMENT '用户ID',
  `message_type` tinyint NOT NULL COMMENT '消息类型(1-接收/2-发送)',
  `content_type` tinyint DEFAULT '1' COMMENT '内容类型(1-文本/2-图片/3-文件)',
  `message_content` text NOT NULL COMMENT '消息内容',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `is_read` bit(1) DEFAULT b'0' COMMENT '是否已读',
  `source_content` varchar(200) DEFAULT NULL COMMENT '来源内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_send_time` (`send_time`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='私信管理表';

-- 12. 线索收集表
CREATE TABLE `t_lead` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `lead_no` varchar(50) NOT NULL COMMENT '线索编号',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `user_avatar` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `wechat_id` varchar(100) DEFAULT NULL COMMENT '微信号',
  `source_type` varchar(50) DEFAULT NULL COMMENT '来源渠道(comment-评论/message-私信/form-表单)',
  `source_account_id` bigint DEFAULT NULL COMMENT '来源账号ID',
  `source_account_name` varchar(100) DEFAULT NULL COMMENT '来源账号名称',
  `collect_time` datetime NOT NULL COMMENT '收集时间',
  `follow_status` tinyint DEFAULT '0' COMMENT '跟进状态(0-新线索/1-跟进中/2-已转化/3-无效)',
  `follow_remark` text COMMENT '跟进备注',
  `is_synced_crm` bit(1) DEFAULT b'0' COMMENT '是否已同步到CRM',
  `crm_sync_time` datetime DEFAULT NULL COMMENT 'CRM同步时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_lead_no` (`lead_no`),
  KEY `idx_phone` (`phone`),
  KEY `idx_follow_status` (`follow_status`),
  KEY `idx_collect_time` (`collect_time`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='线索收集表';

-- 13. 线索跟进记录表
CREATE TABLE `t_lead_follow_record` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `lead_id` bigint NOT NULL COMMENT '线索ID',
  `follow_content` text NOT NULL COMMENT '跟进内容',
  `follow_result` varchar(500) DEFAULT NULL COMMENT '跟进结果',
  `next_follow_time` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_lead_id` (`lead_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='线索跟进记录表';

-- 14. 敏感词配置表
CREATE TABLE `t_sensitive_word` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `word` varchar(100) NOT NULL COMMENT '敏感词',
  `word_type` varchar(50) DEFAULT NULL COMMENT '敏感词类型',
  `status` tinyint DEFAULT '1' COMMENT '状态(0-禁用/1-启用)',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户ID',
  PRIMARY KEY (`id`),
  KEY `idx_word` (`word`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='敏感词配置表';

-- ========================================
-- 索引说明
-- ========================================
-- 1. 所有表都有 tenant_id 索引，支持多租户数据隔离
-- 2. 主要查询字段都建立了索引，提升查询性能
-- 3. 唯一索引用于业务编号字段，保证数据唯一性
-- ========================================
