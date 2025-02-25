#!/bin/bash

# Создаем конфигурацию, если она отсутствует
if [ ! -f /root/.config/yandex-disk/config.cfg ]; then
    echo "Конфигурация не найдена. Запуск настройки..."
    yandex-disk setup
fi

# Запускаем Yandex.Disk в режиме демона и перенаправляем логи в stdout
echo "Запуск Yandex.Disk в режиме демона..."
yandex-disk start --dir=/root/Yandex.Disk --daemon --log-file=/dev/stdout