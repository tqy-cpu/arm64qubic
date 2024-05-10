# easyqubic
一键安装rqiner锄头,启动后自动拉取最新锄头自动挖矿
适用于安卓手机
### 使用
安装termux,建议zerotermux

```
curl -O https://raw.githubusercontent.com/tqy-cpu/arm64qubic/main/install.sh && chmod +x install.sh && ./install.sh
```

### 错误解决
如果多次安装导致.bashrc里写入多次start文件,自行安装vim修改
```
apt install vim
```
```
vi .bashrc
```
拉到底部删除然后ESC :wq即可
如果遇到配置写错了可以`rm eqconfig.json`删除配置

### QA
钱包地址是什么?
https://wallet.qubic.li/自行注册获取

如何查询当前挖矿状态
https://pooltemp.qubic.solutions/info?miner=这里填钱包地址&list=true

### 打赏
![image](5091710529311_.pic.jpg)
