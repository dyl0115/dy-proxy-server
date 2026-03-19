#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "root 권한이 필요해요. sudo로 실행해주세요!"
    exit 1
fi

echo "=== nginx 중지 ==="
systemctl stop nginx
systemctl disable nginx

echo "=== nginx 제거 ==="
apt remove -y nginx
apt autoremove -y

echo "=== certbot 제거 ==="
apt remove -y certbot python3-certbot-nginx

echo "=== 설정 파일 삭제 ==="
rm -rf /etc/nginx
rm -rf /etc/letsencrypt

echo "=== 완료! ==="