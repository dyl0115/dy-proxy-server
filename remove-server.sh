#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "root 권한이 필요해요. sudo로 실행해주세요!"
    exit 1
fi

PATH=${1:-""}

if [ -z "$PATH" ]; then
    echo "사용법: ./remove-server.sh [path]"
    echo "예시: ./remove-server.sh /music"
    exit 1
fi

NGINX_CONF="/etc/nginx/nginx.conf"

# location 블록 삭제 (location /music { ... } 통째로)
sed -i "/location $PATH/,/}/d" $NGINX_CONF

# nginx reload
systemctl reload nginx

echo "=== $PATH 제거 완료! ==="