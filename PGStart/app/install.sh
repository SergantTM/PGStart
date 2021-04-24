#!/bin/sh
#*************************************************
# Настройки PostgreSQL
#*************************************************
# Целевой хост БД PostgreSQL
PGHOST=localhost
# Порт БД PostgreSQL
PGPORT=5432
# Целевая БД PostgreSQL
PGDATABASE=tsup
# Пользователь в PostgreSQL
PGUSER=sysadm
# Пароль пользователя
PGUSERPWD=sysadm
# Пароль суперпользователя PostgreSQL
PGSUPERUSERPWD=password
# Домашний каталог суперпользователя PostgreSQL
PGHOME=/var/lib/postgresql
# Директория табличного пространства для индексов
PGIDXTABLESPACEDIR=/pgindex
# Путь к фалу или директории дампа БД
DUMPPATH=./dump-2185
# Количество потоков для операций импорта данных, создания индексов и констрейнтов
NUMTHREADS=8

#*************************************************
# Развёртывание
#*************************************************
rm -f ./*.log

export PGPASSWORD=$PGSUPERUSERPWD
echo [$(date "+%F %X")] Создание базы данных...
psql -d postgres -h $PGHOST -U postgres --set=USERNAME=$PGUSER --set=PWD=\'$PGUSERPWD\' --set=NEWDBNAME=$PGDATABASE --set=INDEXTABLESPACE=pgindex --set=INDEXDIR=\'$PGIDXTABLESPACEDIR\' -o ./pg_create\_$PGDATABASE.log -f ./pre_install.sql

echo Поиск и запуск файлов миграции....
find -name "*.sql" -print

echo [$(date "+%F %X")] Завершено
