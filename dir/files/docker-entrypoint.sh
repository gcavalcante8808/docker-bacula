#!/bin/bash

set -e

CONF=/etc/bacula/bacula-dir.conf
CONSOLE_CONF=/etc/bacula/bconsole.conf

if [ -z ${DB_HOST} ]; then
    echo "No Default DB Host Provided. Assuming 'db'"
    DB_HOST="db"
fi

if [ -z ${DB_PORT} ]; then
    echo "No Default port for Db Provided. Assuming 5432."
    DB_PORT=5432
fi

if [ -z ${DB_USER} ]; then
    echo "No Default User provided for Db. Assuming bacula"
    DB_USER="zabbix"
fi

if [ -z ${DB_PASS} ]; then
    echo "No Default DB Password provided. Assuming bacula"
    DB_PASS="zabbix"
fi

if [ -z ${DB_NAME} ]; then
    echo "No default db name provided. Assuming bacula"
    DB_NAME="zabbix"
fi


if [ -z ${SD_HOST} ]; then
    echo "No Default SD Host Provided. Assuming 'bacula-sd'"
    SD_HOST="bacula-sd"
fi

if [ -z ${DIR_HOST} ]; then
    echo "No Default Director Host Name. Assuming 'bacula-dir'"
    DIR_HOST="bacula-dir"
fi

if [ -z ${SD_PASSWORD} ]; then
    echo "No Storage password provided ... Exiting ..."
    exit 1
fi

if [ -z ${DIR_PASSWORD} ]; then
    echo "No Director password provided ... Exiting ..."
    exit 1
fi

if [ -z ${MON_PASSWORD} ]; then
    echo "No Director password provided ... Exiting ..."
    exit 1
fi

if [ -z ${CATALOG_NAME} ]; then
    echo "No Default Catalog Name Provided. Assuming 'bacula'"
    CATALOG_NAME="bacula"
fi

#Bacula Director Configuration
sed -i 's/{{ db_name }}/'"${DB_NAME}"'/' $CONF
sed -i 's/{{ db_user }}/'"${DB_USER}"'/' $CONF
sed -i 's/{{ db_pass }}/'"${DB_PASS}"'/' $CONF
sed -i 's/{{ db_host }}/'"${DB_HOST}"'/' $CONF
sed -i 's/{{ sd_host }}/'"${SD_HOST}"'/' $CONF

sed -i 's/{{ mon_pwd }}/'"${MON_PASSWORD}"'/' $CONF
sed -i 's/{{ sd_pwd }}/'"${SD_PASSWORD}"'/' $CONF

sed -i 's/{{ dir_host }}/'"${DIR_HOST}"'/' $CONF
sed -i 's/{{ dir_pwd }}/'"${DIR_PASSWORD}"'/' $CONF
sed -i 's/{{ catalog_name }}/'"${CATALOG_NAME}"'/' $CONF

#Bacula Console Configuration
sed -i 's/{{ dir_pwd }}/'"${DIR_PASSWORD}"'/' $CONSOLE_CONF
sed -i 's/{{ dir_host }}/'"${DIR_HOST}"'/' $CONSOLE_CONF

exec /usr/sbin/bacula-dir -f -c /etc/bacula/bacula-dir.conf
