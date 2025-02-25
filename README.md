# Yandex.Disk в Docker

Этот репозиторий содержит Docker-образ и конфигурацию для запуска Yandex.Disk в контейнере. Логи выводятся в стандартный вывод (stdout), что позволяет легко просматривать их в Portainer или через Docker CLI.

---

## Оглавление

1. [Требования](#требования)
2. [Установка](#установка)
3. [Настройка](#настройка)
4. [Запуск](#запуск)
5. [Просмотр логов](#просмотр-логов)
6. [Обновление](#обновление)
7. [Лицензия](#лицензия)

---

## Требования

- **Docker**: Установите Docker на ваш сервер. Инструкции по установке можно найти [здесь](https://docs.docker.com/get-docker/).
- **Docker Compose** (опционально): Если вы хотите использовать Docker Compose, установите его. Инструкции [здесь](https://docs.docker.com/compose/install/).
- **Portainer** (опционально): Для удобного управления контейнерами через веб-интерфейс.

---

## Установка

1. Клонируйте репозиторий:

   ```bash
   git clone https://github.com/ваш-username/ваш-репозиторий.git
   cd ваш-репозиторий

2. Соберите Docker-образ:

   ```bash
   docker build -t yandex-disk-optimized .

---

## Настройка

1. Создайте директории для конфигурации и данных на хосте:

   ```bash
   mkdir -p /path/to/local/config  # Для конфигурации
   mkdir -p /path/to/local/data    # Для данных Yandex.Disk

2. Настройте Yandex.Disk:

   - Запустите контейнер для настройки:

      ```bash
      docker run -it --rm \
      -v /path/to/local/config:/root/.config/yandex-disk \
      yandex-disk-optimized yandex-disk setup

   - Следуйте инструкциям на экране, чтобы авторизоваться и настроить Yandex.Disk.

---

## Запуск

### Использование Docker CLI

Запустите контейнер с помощью Docker CLI:

   ```bash
   docker run -d \
   --name yandex-disk-container \
   -v /path/to/local/config:/root/.config/yandex-disk \
   -v /path/to/local/data:/root/Yandex.Disk \
   yandex-disk-optimized

### Использование Docker Compose

1. Отредактируйте файл `docker-compose.yml`, указав правильные пути к директориям на хосте.

2. Запустите стек:

   ```bash
   docker-compose up -d

---

## Просмотр логов

### В Portainer

1. Перейдите в раздел **Containers**.
2. Выберите контейнер `yandex-disk-container`.
3. Нажмите **Logs**, чтобы просмотреть логи.

### Через Docker CLI

Используйте команду:

    ```bash
   docker logs -f yandex-disk-container

---

## Обновление

Чтобы обновить контейнер до последней версии:

1. Остановите контейнер:

   ```bash
   docker stop yandex-disk-container

2. Удалите контейнер:

   ```bash
   docker rm yandex-disk-container

3. Пересоберите образ (если необходимо):

   ```bash
   docker build -t yandex-disk-optimized .

4. Запустите контейнер снова, как описано в разделе [Запуск](#запуск).

---

## Лицензия

Этот проект распространяется под лицензией MIT. Подробности см. в файле [LICENSE](LICENSE).

---

## Автор

- **Alexander Bedarev**: [bedarev69@gmail.com](mailto:bedarev69@gmail.com)

---

Если у вас есть вопросы или предложения, создайте [issue](https://github.com/Leliil/docker-yandex.disk/issues) в этом репозитории.
