#!/bin/bash

set -e

CONF=/etc/bacula/bacula-sd.conf

if [ -z ${SD_HOST} ]; then
    echo "No Default Storage Host Name. Assuming 'bacula-sd'"
    SD_HOST="bacula-sd"
fi

if [ -z ${SD_PASSWORD} ]; then
    echo "No Storage password provided ... Exiting ..."
    exit 1
fi

if [ -z ${DIR_HOST} ]; then
    echo "No Default Director Host Name. Assuming 'bacula-dir'"
    DIR_HOST="bacula-dir"
fi


#Bacula Director Configuration
sed -i 's/{{ sd_pwd }}/'"${SD_PASSWORD}"'/' $CONF
sed -i 's/{{ dir_host }}/'"${DIR_HOST}"'/' $CONF
sed -i 's/{{ sd_host }}/'"${SD_HOST}"'/' $CONF

exec /usr/sbin/bacula-sd -f -c $CONF
