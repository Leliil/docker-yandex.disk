# Yandex.Disk в Docker

Этот репозиторий содержит Docker-образ и конфигурацию для запуска Yandex.Disk в контейнере. Логи выводятся в стандартный вывод (stdout), что позволяет легко просматривать их в Portainer или через Docker CLI.

---

## Оглавление

1. [Требования](#требования)
2. [Настройка](#настройка)
3. [Запуск](#запуск)
4. [Просмотр логов](#просмотр-логов)
5. [Обновление](#обновление)
6. [Лицензия](#лицензия)

---

## Требования

- **Docker**: Установите Docker на ваш сервер. Инструкции по установке можно найти [здесь](https://docs.docker.com/get-docker/).
- **Docker Compose** (опционально): Если вы хотите использовать Docker Compose, установите его. Инструкции [здесь](https://docs.docker.com/compose/install/).
- **Portainer** (опционально): Для удобного управления контейнерами через веб-интерфейс.

---

## Настройка

1. Создайте директории для конфигурации и данных на хосте:

   ```bash
   mkdir -p /path/to/local/config  # Для конфигурации
   mkdir -p /path/to/local/data    # Для данных Yandex.Disk
   ```

2. Настройте Yandex.Disk:

   - Запустите контейнер для настройки:

      ```bash
      docker run -it --rm \
      -v /path/to/local/config:/root/.config/yandex-disk \
      leliil/yandex.disk yandex-disk setup
      ```

   - Следуйте инструкциям на экране, чтобы авторизоваться и настроить Yandex.Disk.

---

## Запуск

### Использование Docker CLI

Запустите контейнер с помощью Docker CLI:

   ```bash
   docker run -d \
   --name yandex-disk \
   -v /path/to/local/config:/root/.config/yandex-disk \
   -v /path/to/local/data:/root/Yandex.Disk \
   leliil/yandex.disk
   ```

### Использование Docker Compose

1. Отредактируйте файл `docker-compose.yml`, указав правильные пути к директориям на хосте.

2. Запустите стек:

   ```bash
   docker-compose up -d
   ```

---

## Просмотр логов

### В Portainer

1. Перейдите в раздел **Containers**.
2. Выберите контейнер `yandex-disk`.
3. Нажмите **Logs**, чтобы просмотреть логи.

### Через Docker CLI

Используйте команду:

   ```bash
   docker logs -f yandex-disk
   ```

---

## Обновление

Чтобы обновить контейнер до последней версии:

1. Остановите контейнер:

   ```bash
   docker stop yandex-disk
   ```

2. Удалите контейнер:

   ```bash
   docker rm yandex-disk
   ```

3. Пересоберите образ (если необходимо):

   ```bash
   docker build -t leliil/yandex.disk .
   ```

4. Запустите контейнер снова, как описано в разделе [Запуск](#запуск).

---

## Лицензия

Этот проект распространяется под лицензией MIT. Подробности см. в файле [LICENSE](LICENSE).

---

## Автор

- **Alexander Bedarev**: [bedarev69@gmail.com](mailto:bedarev69@gmail.com)

---

Если у вас есть вопросы или предложения, создайте [issue](https://github.com/Leliil/docker-yandex.disk/issues) в этом репозитории.
