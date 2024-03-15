# easyqubic

###使用

```
curl -O https://raw.githubusercontent.com/chashaochang/easyqubic/main/install.sh && chmod +x install.sh && ./install.sh
```

###错误解决
如果多次安装导致.bashrc里写入多次start文件,自行安装vim修改
```
apt install vim
```
```
vi .bashrc
```
拉到底部删除然后ESC :wq即可
如果遇到配置写错了可以`rm eqconfig.json`删除配置
