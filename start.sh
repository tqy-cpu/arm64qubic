#!/bin/bash

echo "                                              
正在检查锄头更新
"

latestversion=$(curl -s https://api.gitee.com/jingzhi587/rqiner-builds/releases/tag/rqiner/latest | grep -E 'tag_name\": \"v[0-9]+\.[0-9]+\.[0-9]+' -o |head -n 1| tr -d 'tag_name\": \"')

echo "锄头最新版本: $latestversion"

echo "开始下载锄头"

yes | apt update

yes | apt install wget

rm rqiner-aarch64-mobile

wget "https://gitee.com/jingzhi587/rqiner-builds/releases/download/rqiner/rqiner-aarch64-mobile"

chmod +x rqiner-aarch64-mobile

if [ ! -f "eqconfig.json" ]; then
   echo "配置文件不存在"
   read -p "请输入线程数:(建议8)" threadcount
   read -p "请输入qubic钱包地址" wallet
   read -p "请输入当前设备矿工名" workername
   echo "{\"threadcount\": \"$threadcount\", \"wallet\": \"$wallet\", \"workername\": \"$workername\"}" > eqconfig.json
else
   echo "检测到配置文件"
   threadcount=$(grep -o '"threadcount": "[^"]*' eqconfig.json | cut -d '"' -f 4)
   wallet=$(grep -o '"wallet": "[^"]*' eqconfig.json | cut -d '"' -f 4)
   workername=$(grep -o '"workername": "[^"]*' eqconfig.json | cut -d '"' -f 4)
fi

echo "线程数:$threadcount\n钱包地址:$wallet\n矿工名:$workername"
echo "开始挖矿"

./rqiner-aarch64-mobile -t $threadcount -i $wallet -l $workername
