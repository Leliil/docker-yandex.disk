#!/bin/bash

if [ ! -f /.config/yandex-disk/config.cfg ]; then
    yandex-disk setup
else
  yandex.disk
fi
exit 0