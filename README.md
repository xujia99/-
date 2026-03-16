# 人脸识别视频展示系统

## 项目简介

基于人脸识别的智能视频展示系统，通过实时人脸识别技术，为用户提供个性化的视频播放体验。

## 核心功能

- ✅ **实时人脸识别**：使用 face-api.js 进行浏览器端人脸检测和识别
- ✅ **智能视频播放**：根据用户识别结果自动播放视频
- ✅ **断点续播**：记录用户观看进度，下次访问时从上次位置继续播放
- ✅ **数据统计**：后台记录用户访问次数、停留时间等数据
- ✅ **数据持久化**：使用 MySQL 数据库存储所有用户数据

## 技术栈

### 前端
- React 19 + Vite
- face-api.js（人脸识别）
- Tailwind CSS（样式）
- WebSocket（实时通信）

### 后端
- Node.js + Express
- WebSocket (ws)
- MySQL (mysql2)

## 快速开始

### 1. 环境要求

- Node.js 16+
- MySQL 5.7+
- 现代浏览器（支持摄像头访问）

### 2. 安装依赖

```bash
# 后端依赖
cd Server
npm install

# 前端依赖
cd ../Client
npm install
```

### 3. 配置数据库

编辑 `Server/db.config.js`，修改数据库配置：

```javascript
module.exports = {
  host: 'localhost',
  user: 'root',
  password: '你的MySQL密码',
  database: 'face_recognition_db',
  // ...
};
```

初始化数据库：

```bash
mysql -u root -p < Server/init.sql
```

### 4. 准备视频文件

将视频文件放入 `Server/public/slides/` 目录：

```
Server/
└── public/
    └── slides/
        └── 你的视频.mp4  ← 放在这里
```

支持的格式：`.mp4`, `.webm`, `.avi`, `.mov`

### 5. 启动系统

**方式1：使用启动脚本（推荐）**
```bash
start.bat
```

**方式2：手动启动**
```bash
# 终端1：启动后端
cd Server
npm run serve

# 终端2：启动前端
cd Client
npm run dev
```

### 6. 访问系统

- 前端：http://localhost:5173（或Vite显示的地址）
- 后端API：http://localhost:5137
- 数据查看：http://localhost:5137/view/view-data.html

## 系统架构

```
前端 (React)
    ↓ WebSocket
后端 (Express)
    ↓ MySQL
数据库 (用户数据)
```

## 目录结构

```
人脸识别系统9.11/
├── Client/              # 前端项目
│   ├── src/
│   │   ├── App.jsx      # 主应用
│   │   └── main.jsx     # 入口文件
│   └── public/
│       └── models/      # face-api.js 模型
│
├── Server/              # 后端项目
│   ├── server.js        # 服务器主文件
│   ├── db.js            # 数据库操作
│   ├── db.config.js     # 数据库配置
│   ├── init.sql         # 数据库初始化
│   └── public/
│       └── slides/      # 视频文件目录
│
└── start.bat            # 启动脚本
```

## 功能说明

### 人脸识别流程

1. 用户访问页面，授予摄像头权限
2. 系统每250ms检测一次人脸
3. 提取128维特征向量进行识别
4. 匹配或创建新用户ID
5. 发送识别结果到后端

### 视频播放流程

1. 用户识别成功后，后端返回视频URL
2. 前端从数据库读取上次的播放位置
3. 视频从保存的位置继续播放
4. 每5秒更新一次播放位置到数据库

### 数据记录

系统自动记录：
- 用户Face ID
- 访问次数
- 总停留时间
- 视频播放位置
- 创建和更新时间

## API 接口

### 获取所有用户
```
GET /api/users
```

### 获取单个用户
```
GET /api/users/:faceId
```

### 获取统计信息
```
GET /api/statistics
```

## 数据库查看

### Web界面
访问：http://localhost:5137/view/view-data.html

### MySQL命令行
```sql
USE face_recognition_db;
SELECT * FROM users;
```

## 常见问题

### 1. 数据库连接失败
- 检查MySQL服务是否启动
- 检查 `db.config.js` 配置是否正确
- 确保数据库已创建（运行 `init.sql`）

### 2. 视频无法播放
- 检查视频文件是否在 `Server/public/slides/` 目录
- 检查视频格式是否支持
- 查看浏览器控制台错误信息

### 3. 人脸识别不工作
- 确保已授予摄像头权限
- 确保光线充足
- 正对摄像头

## 开发说明

### 项目版本
- 版本：2.0.0
- 项目名称：face-recognition-video-system

### 主要变更（v2.0）
- ✅ 移除PPT转换功能
- ✅ 简化为纯视频播放模式
- ✅ 优化系统结构
- ✅ 提高运行效率

## 许可证

MIT License

## 联系方式

如有问题，请查看项目文档或提交Issue。

