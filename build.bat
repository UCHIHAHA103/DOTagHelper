@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ============================================
echo   DOTagHelper - 本地构建脚本
echo ============================================
echo.

:: 读取版本号
for /f "tokens=*" %%i in ('python -c "import re; m=re.search(r\"WINDOW_TITLE\s*=\s*'DOTagHelper\s+([\d.]+)'\", open('DOTagHelper.py','r',encoding='utf-8').read()); print(m.group(1) if m else 'dev')"') do set VERSION=%%i
echo [INFO] 版本号: %VERSION%

:: 检查 Python 环境
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] 未找到 Python，请先安装 Python 3.11+
    pause
    exit /b 1
)

:: 检查并安装依赖
echo [INFO] 检查依赖...
pip show pywebview >nul 2>&1
if errorlevel 1 (
    echo [INFO] 安装 pywebview...
    pip install pywebview>=4.0
)
pip show pyinstaller >nul 2>&1
if errorlevel 1 (
    echo [INFO] 安装 PyInstaller...
    pip install pyinstaller
)

:: 清理旧构建
echo [INFO] 清理旧构建...
if exist "dist" rd /s /q "dist"
if exist "build" rd /s /q "build"
if exist "DOTagHelper.spec" del /f "DOTagHelper.spec"

:: PyInstaller 打包
echo.
echo [INFO] 开始 PyInstaller 打包...
echo.

pyinstaller --noconfirm --onedir --windowed ^
    --name "DOTagHelper" ^
    --icon "logo.ico" ^
    --add-data "logo.ico;." ^
    --collect-all "webview" ^
    DOTagHelper.py

if errorlevel 1 (
    echo.
    echo [ERROR] PyInstaller 打包失败！
    pause
    exit /b 1
)

:: 复制资源文件到 dist 根目录
echo.
echo [INFO] 复制资源文件...
xcopy /E /I /Y "Data" "dist\DOTagHelper\Data"
xcopy /E /I /Y "Docs" "dist\DOTagHelper\Docs"
xcopy /E /I /Y "Workspace" "dist\DOTagHelper\Workspace"

:: 创建 Logs 目录
if not exist "dist\DOTagHelper\Logs" mkdir "dist\DOTagHelper\Logs"

:: 打包为 zip
echo.
echo [INFO] 创建发布压缩包...
set ARCHIVE_NAME=DOTagHelper_%VERSION%.zip
if exist "%ARCHIVE_NAME%" del /f "%ARCHIVE_NAME%"
powershell -Command "Compress-Archive -Path 'dist\DOTagHelper\*' -DestinationPath '%ARCHIVE_NAME%'"

echo.
echo ============================================
echo   构建完成!
echo   版本: %VERSION%
echo   输出目录: dist\DOTagHelper\
echo   压缩包:   %ARCHIVE_NAME%
echo ============================================
echo.
echo 你可以:
echo   1. 直接运行 dist\DOTagHelper\DOTagHelper.exe 测试
echo   2. 将 %ARCHIVE_NAME% 上传到 GitHub Releases
echo.
pause
