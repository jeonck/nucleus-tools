# Nucleus Tools Web Interface

NVIDIA Omniverse Nucleus 서버를 관리하기 위한 웹 인터페이스입니다.

## 기능

이 웹 인터페이스는 다음과 같은 Nucleus Tools를 지원합니다:

### 디버그 도구
- **discover_all_svcs**: Discovery 서비스 내부 디버깅
- **ping**: Nucleus API 호출을 통한 서버 핑

### 백업 도구
- **dump_backup**: Nucleus 서버의 완전한 백업 생성

### 데이터 관리 도구
- **dump_data**: Nucleus 디렉토리의 로컬 복사본 생성
- **upload**: 로컬 파일을 Nucleus에 업로드

### 탐색 도구
- **ls**: Nucleus 경로 목록 조회 (재귀적 가능)

### 관리 도구
- **mkdirs**: Nucleus에 디렉토리 생성
- **rm**: Nucleus의 파일 및 디렉토리 삭제 (⚠️ 위험)

### 유틸리티 도구
- **mklinks**: 백업 출력에서 심볼릭 링크 생성

### 관리자 도구
- **scrub_users**: GDPR 준수를 위한 사용자 PII 정보 스크러빙 (⚠️ 위험)

## 사용 방법

### 1. 개발 서버 실행

```bash
python3 server.py
```

또는

```bash
python server.py
```

### 2. 웹 브라우저에서 접속

```
http://localhost:8080
```

### 3. 도구 사용

1. **도구 선택**: 원하는 도구 카드를 클릭하여 확장
2. **매개변수 입력**: 필요한 서버 정보, 경로, 옵션 등을 입력
3. **명령어 미리보기**: 입력한 내용을 바탕으로 생성된 Docker 명령어 확인
4. **실행 또는 복사**: 명령어를 실행하거나 클립보드에 복사

## 기본 Docker 명령어 형식

```bash
sudo docker run -d --restart always -e "ACCEPT_EULA=Y" -p 8081:80 $NUC_TOOLS [tool_name] [arguments]
```

## 주요 기능

### 🔍 검색 및 필터링
- 도구 이름이나 설명으로 검색
- 카테고리별 필터링 (debug, backup, data, navigation, management, utility, admin)

### 📝 명령어 생성
- 사용자 입력을 바탕으로 자동으로 Docker 명령어 생성
- 실시간 미리보기

### 📋 명령어 기록
- 실행된 명령어의 기록 유지
- 클립보드 복사 기능

### ⚠️ 안전장치
- 위험한 도구 (rm, scrub_users)에 대한 경고 표시
- 드라이 런 모드 기본 설정

## 보안 주의사항

1. **비밀번호**: 브라우저에서 입력한 비밀번호는 로컬에 저장되지 않습니다.
2. **위험한 작업**: `rm`과 `scrub_users` 같은 위험한 도구는 기본적으로 드라이 런 모드로 실행됩니다.
3. **네트워크**: 이 도구는 로컬 개발 서버에서만 실행하세요.

## 시스템 요구사항

- Python 3.6+
- 웹 브라우저 (Chrome, Firefox, Safari, Edge)
- Docker (Nucleus Tools 실행을 위해)

## 포트 설정

- **웹 인터페이스**: 8080 (변경 가능)
- **Nucleus Tools**: 8081 (Docker 명령어에서 설정)

## 문제 해결

### 서버가 시작되지 않는 경우
1. Python이 설치되어 있는지 확인
2. 포트 8080이 사용 중이 아닌지 확인
3. 다른 포트 사용: `python server.py --port 8090`

### Docker 명령어가 실행되지 않는 경우
1. Docker가 설치되어 있고 실행 중인지 확인
2. `$NUC_TOOLS` 환경변수가 올바른 이미지를 가리키는지 확인
3. EULA 동의가 필요할 수 있습니다

### 웹 인터페이스가 제대로 표시되지 않는 경우
1. 브라우저에서 JavaScript가 활성화되어 있는지 확인
2. 최신 브라우저를 사용하고 있는지 확인
3. 브라우저 개발자 도구에서 오류 확인

## 라이선스

NVIDIA Omniverse Nucleus Tools의 웹 인터페이스입니다.
사용 전 해당 도구들의 라이선스를 확인하세요.

## 기여

버그 리포트나 기능 제안은 이슈를 통해 제출해 주세요.

---

**⚠️ 중요**: 이 도구는 프로덕션 환경에서 중요한 데이터를 다룹니다. 사용 전 충분한 테스트를 수행하고, 항상 백업을 유지하세요.
# nucleus-tools
