FROM debian

MAINTAINER Alexander Bedarev <bedarev69@gmail.com>

RUN apt-get update \

    # Upgrade & Install wget
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install wget -y \

    # Download & Install Disk.Yandex
    && wget https://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb \
    && dpkg -i yandex-disk_latest_amd64.deb \
    && apt-get install -f -y \

    # Cleanup
    && rm *.deb \
    && apt-get purge -y \
    && apt-get autoremove -y \
    && apt-get autoclean -y \

    && mkdir /root/Yandex.Disk

ENTRYPOINT ["yandex-disk"]
CMD ["start", "--no-daemon", "--dir=/root/Yandex.Disk"]