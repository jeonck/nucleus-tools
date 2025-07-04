@echo off
REM Nucleus Tools Web Interface 시작 스크립트 (Windows)

echo 🔧 Nucleus Tools Web Interface 설정 중...

REM Python 버전 확인
python --version >nul 2>&1
if %errorlevel% == 0 (
    set PYTHON_CMD=python
    goto :python_found
)

python3 --version >nul 2>&1
if %errorlevel% == 0 (
    set PYTHON_CMD=python3
    goto :python_found
)

echo ❌ Python이 설치되어 있지 않습니다.
echo 💡 Python 3.6 이상을 설치해주세요.
pause
exit /b 1

:python_found
for /f "tokens=*" %%i in ('%PYTHON_CMD% --version') do set PYTHON_VERSION=%%i
echo ✅ Python 찾음: %PYTHON_VERSION%

REM 현재 디렉토리로 이동
cd /d "%~dp0"

echo 📁 현재 디렉토리: %cd%

REM 서버 시작
echo.
echo 🚀 웹 서버를 시작합니다...
%PYTHON_CMD% server.py %*

pause
