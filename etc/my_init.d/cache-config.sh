#!/bin/sh

if [ -z "${DEV}" ]
then
  php ${WORK_DIR}/artisan config:cache
fi