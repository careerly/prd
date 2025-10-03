# 视频与图文内容管理与分发平台 - 完整原型页面

## 项目概述

这是一套完整的内容管理与分发平台的HTML原型页面，包含主功能页面和所有二级表单/详情页面，支持完整的点击交互跳转。所有页面都基于统一的设计风格，可直接用于Figma UI设计。

## 📁 文件结构（共21个文件）

### 核心页面（10个）
1. **index.html** - 首页工作台
2. **01-video-materials.html** - 视频素材管理
3. **02-image-materials.html** - 图文素材管理
4. **03-account-management.html** - 账号管理
5. **04-publish-center.html** - 发布中心
6. **05-comment-management.html** - 评论管理
7. **06-message-management.html** - 私信管理
8. **07-lead-collection.html** - 线索收集
9. **08-data-analysis.html** - 数据分析
10. **09-system-settings.html** - 系统设置

### 二级表单页面（9个）
11. **form-video-upload.html** - 上传视频素材表单
12. **form-video-edit.html** - 编辑视频素材表单
13. **form-image-create.html** - 新建图文素材表单
14. **form-account-add.html** - 新增账号表单（含授权说明）
15. **form-publish-create.html** - 新建发布任务表单
16. **form-comment-reply.html** - 回复评论表单
17. **form-lead-add.html** - 手动添加线索表单
18. **form-lead-detail.html** - 线索详情页（含跟进记录）
19. **form-user-add.html** - 新增用户表单（含权限设置）

### 样式文件（1个）
20. **common.css** - 通用样式文件

### 文档（1个）
21. **README.md** - 项目说明文档

## 🔗 交互跳转关系

### 视频素材管理
- `01-video-materials.html` → **"+ 上传视频"** → `form-video-upload.html`
- `01-video-materials.html` → **"编辑"按钮** → `form-video-edit.html`

### 图文素材管理
- `02-image-materials.html` → **"+ 新建图文"** → `form-image-create.html`

### 账号管理
- `03-account-management.html` → **"+ 新增账号"** → `form-account-add.html`

### 发布中心
- `04-publish-center.html` → **"+ 新建发布任务"** → `form-publish-create.html`

### 评论管理
- `05-comment-management.html` → **"回复"按钮** → `form-comment-reply.html`

### 线索收集
- `07-lead-collection.html` → **"+ 手动添加线索"** → `form-lead-add.html`
- `07-lead-collection.html` → **"详情"按钮** → `form-lead-detail.html`

### 系统设置
- `09-system-settings.html` → **"+ 新增用户"** → `form-user-add.html`

## 🎨 页面功能说明

### 1. 首页工作台 (index.html)
- 快捷入口卡片
- 数据概览统计
- 待处理事项列表
- 系统公告
- 最近发布记录

### 2. 素材管理模块

#### 视频素材管理 (01-video-materials.html)
- 搜索筛选：名称、分类、标签、时间
- 网格视图展示
- 上传、编辑、删除操作
- 分页功能

#### 上传视频表单 (form-video-upload.html)
- 视频文件上传区域
- 基本信息填写（名称、简介、分类）
- 标签管理
- 封面图上传
- 权限设置

#### 编辑视频表单 (form-video-edit.html)
- 显示当前视频信息
- 所有字段可编辑
- 状态管理
- 创建和更新时间显示

#### 图文素材管理 (02-image-materials.html)
- 搜索筛选功能
- 列表视图展示
- 状态标签（已发布、草稿、审核中、已下架）
- 批量操作支持

#### 新建图文表单 (form-image-create.html)
- 标题输入
- 封面图上传
- 多图上传（最多9张）
- 富文本内容编辑
- 发布平台选择
- 保存为草稿功能

### 3. 账号管理模块

#### 账号列表 (03-account-management.html)
- 平台筛选（抖音、小红书、快手）
- 账号分组管理
- 状态监控（正常、掉线、违规）
- 粉丝数据展示

#### 新增账号表单 (form-account-add.html)
- 平台选择
- 授权说明提示
- 分组设置
- 权限配置（发布、评论、私信）
- 开始授权按钮

### 4. 发布中心模块

#### 发布任务列表 (04-publish-center.html)
- 任务状态追踪（待发布、发布中、已成功、已失败）
- 平台和账号信息
- 计划时间和实际时间对比
- 重试功能

#### 新建发布任务 (form-publish-create.html)
- 素材选择
- 发布平台和账号选择
- 发布方式（立即/定时）
- 智能推荐发布时间
- 发布文案编辑
- 话题标签和定位
- 发布设置（评论、转发、原创声明）
- 失败自动重试配置

### 5. 交互管理模块

#### 评论管理 (05-comment-management.html)
- 关键词搜索
- 敏感词标记（黄色背景高亮）
- 评论状态（待处理、已回复、已忽略）
- 批量操作

#### 回复评论表单 (form-comment-reply.html)
- 原评论内容显示
- 回复内容编辑
- 快捷回复模板
- 回复方式（公开/私信）
- 附加操作（标记已处理、添加线索、置顶）

#### 私信管理 (06-message-management.html)
- 左右分栏布局
- 会话列表（带未读标记）
- 实时聊天界面
- 快捷回复和发送名片
- 标记线索功能

### 6. 线索管理模块

#### 线索列表 (07-lead-collection.html)
- 来源渠道筛选
- 跟进状态管理
- 手机号和微信号显示
- 批量导出和CRM同步

#### 添加线索表单 (form-lead-add.html)
- 用户基本信息
- 联系方式（手机、微信、邮箱）
- 来源渠道和账号
- 意向等级和跟进状态
- 分配跟进人
- 详细说明和附件上传
- 下次跟进时间设置

#### 线索详情页 (form-lead-detail.html)
- 左右分栏布局
- 左侧：基本信息 + 跟进记录时间轴
- 右侧：快捷操作 + 状态管理 + 标签
- 跟进记录添加功能
- 电话、私信、邮件快捷操作

### 7. 数据分析模块 (08-data-analysis.html)
- 时间范围选择
- 8个统计卡片（浏览量、点赞数等）
- 趋势图表展示区域
- 热门内容TOP 10
- 平台数据分布（饼图占位）
- 活跃时段分析（热力图占位）

### 8. 系统设置模块

#### 设置主页 (09-system-settings.html)
- 左侧设置菜单
- 用户列表展示
- 角色标签
- 状态管理（启用/禁用）

#### 新增用户表单 (form-user-add.html)
- 基本信息（用户名、姓名、密码）
- 角色选择
- 联系方式
- 详细权限树（可展开）
  - 素材管理权限
  - 账号管理权限
  - 发布管理权限
  - 数据分析权限
- 全选/清空/按角色选择功能

## 🎯 设计特点

### 1. 统一的视觉风格
- **顶部导航**：深蓝色渐变（#4a5f7f → #5d7395）
- **侧边栏**：浅灰色背景（#f5f6f8）
- **主题色**：蓝色（#165dff）
- **内容卡片**：白色背景，圆角阴影

### 2. 完整的组件库
- ✅ 搜索筛选区域
- ✅ 操作工具栏
- ✅ 数据表格（带排序、分页）
- ✅ 表单组件（输入框、下拉框、文本域）
- ✅ 状态标签（成功、警告、错误、信息）
- ✅ 统计卡片
- ✅ 媒体预览卡片
- ✅ 按钮组件（主要、次要、文本、危险）

### 3. 交互功能
- ✅ 所有主要按钮都配置了 `onclick` 跳转
- ✅ 表单提交/取消按钮跳转回列表页
- ✅ 侧边栏导航链接完整
- ✅ 面包屑导航

### 4. 表单设计特色
- 必填项标记（红色星号）
- 提示信息和帮助文本
- 文件上传拖拽区域
- 快捷操作按钮
- 权限树形结构
- 时间轴展示（跟进记录）

## 📱 使用方法

### 1. 浏览器预览
```bash
# 直接用浏览器打开任意HTML文件
open index.html
```

### 2. 完整交互测试
1. 从 `index.html` 开始
2. 点击快捷入口进入各功能模块
3. 点击"新增""编辑"等按钮测试跳转
4. 在表单页面点击"保存""取消"返回列表

### 3. 导入Figma
1. **方式一**：浏览器截图导入
   - 用浏览器打开HTML页面
   - 截图后导入Figma

2. **方式二**：HTML转Figma插件
   - 使用Figma的HTML导入插件
   - 逐个导入各页面

3. **方式三**：手动还原
   - 参考HTML页面的布局和样式
   - 在Figma中手动绘制UI

## 🛠️ 技术栈

- **HTML5**：语义化标签
- **CSS3**：Flexbox、Grid布局
- **JavaScript**：onclick事件跳转
- **无依赖**：纯静态页面，无需框架

## 📋 完整页面清单

| 序号 | 文件名 | 页面名称 | 类型 | 跳转来源 |
|------|--------|----------|------|----------|
| 1 | index.html | 首页工作台 | 主页 | - |
| 2 | 01-video-materials.html | 视频素材管理 | 列表页 | 首页快捷入口 |
| 3 | form-video-upload.html | 上传视频 | 表单页 | 视频素材管理 |
| 4 | form-video-edit.html | 编辑视频 | 表单页 | 视频素材管理 |
| 5 | 02-image-materials.html | 图文素材管理 | 列表页 | 首页快捷入口 |
| 6 | form-image-create.html | 新建图文 | 表单页 | 图文素材管理 |
| 7 | 03-account-management.html | 账号管理 | 列表页 | 首页快捷入口 |
| 8 | form-account-add.html | 新增账号 | 表单页 | 账号管理 |
| 9 | 04-publish-center.html | 发布中心 | 列表页 | 首页快捷入口 |
| 10 | form-publish-create.html | 新建发布任务 | 表单页 | 发布中心 |
| 11 | 05-comment-management.html | 评论管理 | 列表页 | 首页快捷入口 |
| 12 | form-comment-reply.html | 回复评论 | 表单页 | 评论管理 |
| 13 | 06-message-management.html | 私信管理 | 聊天页 | 侧边栏 |
| 14 | 07-lead-collection.html | 线索收集 | 列表页 | 首页快捷入口 |
| 15 | form-lead-add.html | 添加线索 | 表单页 | 线索收集 |
| 16 | form-lead-detail.html | 线索详情 | 详情页 | 线索收集 |
| 17 | 08-data-analysis.html | 数据分析 | 报表页 | 侧边栏 |
| 18 | 09-system-settings.html | 系统设置 | 列表页 | 侧边栏 |
| 19 | form-user-add.html | 新增用户 | 表单页 | 系统设置 |
| 20 | common.css | 通用样式 | 样式文件 | 所有页面引用 |
| 21 | README.md | 说明文档 | 文档 | - |

## ⚠️ 注意事项

1. **图表占位**：数据分析页面的图表区域为占位符，实际开发需集成ECharts
2. **图标**：使用Emoji作为占位图标，建议替换为专业图标字体
3. **文件上传**：上传功能为静态展示，实际需要后端API支持
4. **数据**：所有数据为示例数据，实际使用需对接API

## 🚀 后续优化建议

1. **图标系统**：引入iconfont或Font Awesome
2. **图表库**：集成ECharts或Chart.js
3. **响应式**：添加移动端适配
4. **表单验证**：添加JavaScript表单验证
5. **组件化**：抽取可复用组件

## 📞 联系方式

如有任何问题或建议，请随时反馈。

---

**版本**: v2.0（包含完整二级页面）  
**更新日期**: 2025-10-03  
**文件总数**: 21个  
**支持交互**: ✅ 完整点击跳转  
**用途**: Figma UI设计 + 原型演示
