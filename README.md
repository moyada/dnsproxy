# DNS proxy

使用 [dnsproxy](https://github.com/AdguardTeam/dnsproxy) 构造 DNS 代理服务器，开放 1853 端口

> ./dnsproxy -p 1853 -u 8.8.8.8:53 -u 8.8.4.4:53 -u 1.1.1.1:53 --cache --cache-min-ttl=10 --cache-max-ttl=600 --fastest-addr -v -o dns.log

## Build

```
docker buildx install
docker buildx create --use
docker buildx build --platform linux/amd64/v2,linux/amd64,linux/arm64 -t xueyikang/dnsproxy . --push
```

## Deploy

```
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

docker pull xueyikang/dnsproxy:latest

docker run --network=host -d --name dnsproxy --restart=always xueyikang/dnsproxy:latest
```
