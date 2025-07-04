FROM python:3.9-slim

WORKDIR /app

# 필요한 패키지만 설치 (웹 서버는 Python 기본 라이브러리 사용)
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# 애플리케이션 파일 복사
COPY . .

# 포트 노출
EXPOSE 8080

# 서버 실행
CMD ["python", "server.py", "--host", "0.0.0.0"]
