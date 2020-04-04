#!/bin/sh
set -e
if [ -z "$DB_HOST" ]; then
  # If not defined, get DOCKER HOST IP
  DB_HOST_TEMP=$(route | awk '/^default/ { print $2 }')
else
  DB_HOST_TEMP=$DB_HOST
fi

if [ -z "$DB_USER" ]; then
  DB_USER_TEMP="user"
else
  DB_USER_TEMP=$DB_USER
fi

if [ -z "$DB_PASSWORD" ]; then
  DB_PASSWORD_TEMP="password"
else
  DB_PASSWORD_TEMP=$DB_PASSWORD
fi

if [ -z "$DB_PORT" ]; then
  DB_PORT_TEMP="3306"
else
  DB_PORT_TEMP=$DB_PORT
fi

if [ -z "$DB_NAME" ]; then
  DB_NAME_TEMP="mydb"
else
  DB_NAME_TEMP=$DB_NAME
fi

if [ -z "$PORT" ]; then
  PORT_TEMP="3000"
else
  PORT_TEMP=$PORT
fi

python3 expose_existing.py mysql+pymysql://$DB_USER_TEMP:$DB_PASSWORD_TEMP@$DB_HOST_TEMP:$DB_PORT_TEMP/$DB_NAME_TEMP --port $PORT_TEMP
