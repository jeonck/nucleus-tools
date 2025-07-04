#!/bin/bash
# Nucleus Tools Web Interface 시작 스크립트

echo "🔧 Nucleus Tools Web Interface 설정 중..."

# Python 버전 확인
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    echo "❌ Python이 설치되어 있지 않습니다."
    echo "💡 Python 3.6 이상을 설치해주세요."
    exit 1
fi

echo "✅ Python 찾음: $($PYTHON_CMD --version)"

# 현재 디렉토리로 이동
cd "$(dirname "$0")"

echo "📁 현재 디렉토리: $(pwd)"

# 서버 시작
echo ""
echo "🚀 웹 서버를 시작합니다..."
$PYTHON_CMD server.py "$@"
