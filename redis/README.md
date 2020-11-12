#### redis安装
```
# 打开持久化
docker run -d -p 6379:6379 -v $PWD/data:/data   redis:3.2.10 redis-server --appendonly yes
```