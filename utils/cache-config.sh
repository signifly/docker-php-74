#!/bin/sh

if [ -z "${DEV}" ]
then
  if [ -f "${WORK_DIR}/artisan" ]
  then
    . /utils/vault-env.sh

    echo "Caching application"
    php ${WORK_DIR}/artisan optimize
    php ${WORK_DIR}/artisan view:cache

  else
    echo "Artisan not present"
  fi
fi
