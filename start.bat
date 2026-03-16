@echo off
chcp 65001 >nul
echo ========================================
echo   人脸识别系统 - 一键启动脚本
echo ========================================
echo.

cd /d %~dp0

echo [1/2] 检查依赖...
if not exist "Server\node_modules" (
    echo 正在安装后端依赖...
    cd Server
    call npm install
    cd ..
)

if not exist "Client\node_modules" (
    echo 正在安装前端依赖...
    cd Client
    call npm install
    cd ..
)

echo.
echo [2/2] 启动服务...
echo.

REM 启动后端服务器（新窗口）
echo 正在启动后端服务器 (端口 5137)...
start "后端服务器 - 端口 5137" cmd /k "cd /d %~dp0Server && npm run serve"

REM 等待2秒让后端先启动
timeout /t 2 /nobreak >nul

REM 启动前端开发服务器（新窗口）
echo 正在启动前端开发服务器...
start "前端开发服务器 - Vite" cmd /k "cd /d %~dp0Client && npm run dev"

echo.
echo ========================================
echo   启动完成！
echo ========================================
echo   后端: http://localhost:5137
echo   前端: 查看前端窗口中的地址（通常是 http://localhost:5173）
echo.
echo   按任意键关闭此窗口（服务将继续运行）...
pause >nul