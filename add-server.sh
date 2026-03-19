#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "root 권한이 필요해요. sudo로 실행해주세요!"
    exit 1
fi

ID=${1:-""}
PORT=${2:-""}
PATH=${3:-""}

if [ -z "$ID" ] || [ -z "$PORT" ] || [ -z "$PATH" ]; then
    echo "사용법: ./add-server.sh [id] [port] [path]"
    echo "예시: ./add-server.sh music 8001 /music"
    exit 1
fi

NGINX_CONF="/etc/nginx/nginx.conf"

# location 블록 생성
LOCATION="    location $PATH {\n        proxy_pass http://localhost:$PORT;\n    }"

# SERVERS START 아래에 삽입
sed -i "/# === SERVERS START ===/a $LOCATION" $NGINX_CONF

# nginx reload (nginx 재시작 없이 nginx.conf 바로 적용)
systemctl reload nginx

echo "=== $ID 추가 완료! ($PATH → $PORT) ==="