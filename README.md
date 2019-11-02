# lean 的 OpenWRT 路由器固件 docker 编译环境

### 自己构建固件环境

```
git clone https://github.com/lihaixin/openwrt-docker-builder.git
cd openwrt-docker-builder
docker build -t lihaixin/openwrt-docker-builder - < Dockerfile
```
或者直接下载镜像
```
docker pull lihaixin/openwrt-docker-builder
```

### 运行容器更新到代码 根据自己设备配置菜单

```
mkdir -p openwrt
docker run --rm -it --user `id -u` --net=host -v `pwd`/openwrt:/home/sanjin lihaixin/openwrt-docker-builder
git clone https://github.com/coolsnowwolf/lede && cd lede
./scripts/feeds update -a 
./scripts/feeds install -a
make menuconfig 
```

