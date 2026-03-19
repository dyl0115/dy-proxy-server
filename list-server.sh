#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "root 권한이 필요해요. sudo로 실행해주세요!"
    exit 1
fi

NGINX_CONF="/etc/nginx/nginx.conf"

echo "=== 등록된 서버 목록 ==="
echo "PATH       PORT"
echo "---------- -----"

# location이랑 proxy_pass 한 쌍씩 추출
sed -n '/# === SERVERS START ===/,/# === SERVERS END ===/p' $NGINX_CONF \
    | grep -E "location|proxy_pass" \
    | paste - - \
    | awk '{
        path = $2
        port = $4
        gsub("http://localhost:", "", port)
        gsub(";", "", port)
        print path "       " port
    }'
```

실행하면:
```
=== 등록된 서버 목록 ===
PATH       PORT
---------- -----
/music     8001
/tts       8002