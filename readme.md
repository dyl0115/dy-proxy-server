# dy-proxy-server

Ubuntu 24.04 기반 nginx 리버스 프록시 서버 설정 관리 스크립트 모음

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
- add-server.sh - 서버 추가
- list-servers.sh - 서버 목록 조회
- remove-server.sh - 서버 제거