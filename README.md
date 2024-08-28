# Yandex.Disk Docker image
```
docker run -d --name yandex.disk --restart always \
           -v /path:/root/.config/yandex-disk \
           -v /path:/root/Yandex.Disk \
           leliil/yandex.disk
```
