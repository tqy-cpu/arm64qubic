#!/bin/bash

echo "                                              
小白一键安卓脚本
"

# echo -e "\033[0;31m开魔法！开魔法！开魔法！\033[0m\n"

# read -p "确保开了魔法后按回车继续"

current=/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu

yes | apt update

yes | apt upgrade

# 安装proot-distro
DEBIAN_FRONTEND=noninteractive pkg install proot-distro -y

# 创建并安装Ubuntu
DEBIAN_FRONTEND=noninteractive proot-distro install ubuntu

# Check Ubuntu installed successfully
 if [ ! -d "$current" ]; then
   echo "Ubuntu安装失败了，请更换魔法或者手动安装Ubuntu~"
    exit 1
 fi

    echo "Ubuntu成功安装到Termux"

echo "正在下载启动文件~"

cd $current/root

curl -O https://raw.githubusercontent.com/chashaochang/easyqubic/main/start.sh

if [ ! -f "$current/root/start.sh" ]; then
   echo "启动文件下载失败了"
   exit
fi

echo "bash /root/start.sh" >>$current/root/.bashrc

echo "proot-distro login ubuntu" >>/data/data/com.termux/files/home/.bashrc

source /data/data/com.termux/files/home/.bashrc

exit
