FROM debian

MAINTAINER Alexander Bedarev <bedarev69@gmail.com>

RUN apt-get update \

    # Upgrade & Install wget
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install wget -y \

    # Download & Install Disk.Yandex
    && echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex-disk.list > /dev/null \
    && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - \
    && apt-get update \
    && sudo apt-get install -y yandex-disk \

    # Cleanup
    && apt-get autoremove -y \
    && apt-get autoclean -y \

    && mkdir /root/Yandex.Disk

ENTRYPOINT ["yandex-disk"]
ENTRYPOINT ["/yandex-disk.sh"]
CMD ["/opt/dropbox/bin/dropboxd"]
CMD ["start", "--no-daemon", "--dir=/root/Yandex.Disk"]