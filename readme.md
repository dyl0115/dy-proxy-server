# dy-proxy-server

Ubuntu 24.04 기반 nginx 리버스 프록시 서버 설정 관리 스크립트 모음

HTTPS를 기본으로 세팅해준다. 단, 도메인은 미리 준비되어 있어야 한다.

설치 후 서버를 동적으로 추가, 조회, 제거할 수 있다. nginx 재시작 없이 reload로 반영된다.

## 사전 준비

- 도메인 준비 (예: duckdns.org 등)
- OCI 또는 클라우드 콘솔에서 방화벽 인바운드 규칙에 80, 443 포트 오픈 필요

## 설치
```bash
git clone https://github.com/dyl0115/dy-proxy-server.git
cd dy-proxy-server
chmod +x *.sh
sudo ./install.sh [도메인]
```

## 사용법

서버 추가
```bash
sudo ./add-server.sh [id] [port] [path]
sudo ./add-server.sh music 8001 /music
```

서버 목록
```bash
./list-servers.sh
```

서버 제거
```bash
sudo ./remove-server.sh [path]
sudo ./remove-server.sh /music
```

## 파일 구조

- install.sh - nginx, certbot 설치 및 도메인 설정
- nginx.conf - nginx 기본 설정 템플릿
- nginx.temp.conf - certbot 인증서 발급용 임시 설정
- add-server.sh - 서버 추가
- list-servers.sh - 서버 목록 조회
- remove-server.sh - 서버 제거
- uninstall.sh - nginx 전체 제거
