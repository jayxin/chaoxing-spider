#!/bin/bash

function down { # 下载图片
    url="$1"

    s="$(basename $url)"
    fname="$(echo $s | cut -d '?' -f 1 -).jpg"

    ua0="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0"
    ua1="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36"

    if [[ $(( $RANDOM % 2 )) -eq 0 ]] ; then
        wget -O "tmp/$fname" --user-agent="$ua0" "$url"
    else
        wget -O "tmp/$fname" --user-agent="$ua1" "$url"
    fi

    if [[ $? -eq 0 ]] ; then
        is_json=$(file "$fname" | grep "JSON")

        # 检测验证码
        if [[ -n "$is_json" ]]
        then
            echo "[JSON]: Failed at $fname"
            rm $fname
            exit 1
        fi

        # 检测失效图片
        diff ./assets/error.jpg "$fname" &> /dev/null
        if [[ $? -eq 0 ]] ; then
          echo "[Error]: Failed at $fname"
          rm "$fname"
          exit 1
        fi
    fi

    sleep 1.5s
}

mkdir -p tmp

for item in $(cat url.txt)
do
    down "$item"
done
