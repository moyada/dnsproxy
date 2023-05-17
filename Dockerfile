FROM alpine:latest

# 设置工作目录
WORKDIR /app

RUN wget -O app.tar.gz https://github.com/AdguardTeam/dnsproxy/releases/download/v0.49.1/dnsproxy-linux-amd64-v0.49.1.tar.gz \
    && tar -zxvf app.tar.gz \
    && mv linux-amd64/* .

# 声明服务端口
EXPOSE 1853
# 启动应用程序
CMD ["./dnsproxy", "-l", "0.0.0.0", "-p", "1853", "-u", "8.8.8.8:53", "-u", "8.8.4.4:53", "-u", "1.1.1.1:53", "--cache", "--cache-min-ttl=10", "--cache-max-ttl=600", "--fastest-addr", "-v", "-o", "dnsproxy.log"]