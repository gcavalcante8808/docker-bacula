#!/bin/bash

set -e

CONF=/etc/bacula/bacula-fd.conf

if [ -z ${DIR_PASSWORD} ]; then
    echo "No Director password provided ... Exiting ..."
    exit 1
fi

if [ -z ${DIR_HOST} ]; then
    echo "No Default Director Host Name. Assuming 'bacula-dir'"
    DIR_HOST="bacula-dir"
fi

if [ -z ${MON_PASSWORD} ]; then
    echo "No Director password provided ... Exiting ..."
    exit 1
fi

#Bacula Director Configuration
sed -i 's/{{ dir_pwd }}/'"${DIR_PASSWORD}"'/' $CONF
sed -i 's/{{ dir_host }}/'"${DIR_HOST}"'/' $CONF
sed -i 's/{{ mon_pwd }}/'"${MON_PASSWORD}"'/' $CONF


exec /usr/sbin/bacula-fd -f -c /etc/bacula/bacula-fd.conf
