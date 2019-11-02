# lede 的 docker 编译环境

### 自己构建固件环境

```
git clone https://github.com/lihanxin/openwrt-docker-builder.git
cd openwrt-docker-builder
docker build -t openwrt-docker-builder - < Dockerfile
```
或者
```
docker pull lihaixin/openwrt-docker-builder
```

### 运行容器更新到代码 根据自己设备配置菜单

```
mkdir -p /doc/work/openwrt
docker run --rm -it --net=host -v /doc/work/openwrt:/lede openwrt-docker-builder
git pull
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig 
```

