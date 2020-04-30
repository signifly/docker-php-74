#!/bin/bash

if [ -d "${WORK_DIR}/artisan" ]
then
  php ${WORK_DIR}/artisan config:cache
  php ${WORK_DIR}/artisan route:cache
  php ${WORK_DIR}/artisan view:cache

  if [ -d "${WORK_DIR}/vendor/laravel/horizon" ]
  then
    php ${WORK_DIR}/artisan horizon:assets
  fi
fi
