# Используем минималистичный образ Debian Slim
FROM debian:12-slim

# Указываем метаданные
LABEL maintainer="Alexander Bedarev <bedarev69@gmail.com>"

# Устанавливаем зависимости и Yandex.Disk
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    wget https://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb && \
    dpkg -i yandex-disk_latest_amd64.deb && \
    apt-get install -f -y --no-install-recommends && \
    # Очищаем кэш и временные файлы
    apt-get purge -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* yandex-disk_latest_amd64.deb && \
    # Создаем директорию для Yandex.Disk
    mkdir -p /root/Yandex.Disk

# Копируем скрипт инициализации
COPY yandex-disk.sh /usr/local/bin/yandex-disk.sh
RUN chmod +x /usr/local/bin/yandex-disk.sh

# Указываем точку входа
ENTRYPOINT ["yandex-disk.sh"]