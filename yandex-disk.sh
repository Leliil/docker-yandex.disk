#!/bin/bash

# Проверяем, существует ли файл passwd (токен авторизации)
if [ ! -f /root/.config/yandex-disk/passwd ]; then
    echo "Токен авторизации не найден. Генерация кода для авторизации..."

    # Генерируем код для авторизации
    AUTH_CODE=$(yandex-disk token --password 2>&1 | grep -oP 'code=\K[^ ]+')
    
    if [ -z "$AUTH_CODE" ]; then
        echo "Ошибка: не удалось получить код для авторизации."
        exit 1
    fi

    # Выводим код в лог
    echo "Перейдите по ссылке и введите код: https://ya.ru/device"
    echo "Код для авторизации: $AUTH_CODE"

    # Ожидаем создания файла passwd
    echo "Ожидание авторизации..."
    while [ ! -f /root/.config/yandex-disk/passwd ]; do
        sleep 5
    done

    echo "Авторизация успешно завершена. Файл passwd создан."
fi

# Запускаем Yandex.Disk
echo "Запуск Yandex.Disk..."
yandex-disk start --dir=/root/Yandex.Disk --no-daemon