#!/bin/bash

prefix="/etc/service"

horizon=${prefix}/horizon/down
websocket=${prefix}/websocket/down
app=${prefix}/phpfpm/down
nginx=${prefix}/nginx/down
cron=${prefix}/cron/down
migrate=${prefix}/migrate/down


[[ ! -f ${websocket} ]] && touch ${websocket}
[[ ! -f ${app} ]] && touch ${app}
[[ ! -f ${horizon} ]] && touch ${horizon}
[[ ! -f ${nginx} ]] && touch ${nginx}
[[ ! -f ${cron} ]] && touch ${cron}
[[ ! -f ${migrate} ]] && touch ${migrate}

case $ROLE in

  horizon)
    [[ -f ${horizon} ]] && rm ${horizon}
    ;;

  websocket)
    [[ -f ${websocket} ]] && rm ${websocket}
    ;;

  cron)
    [[ -f ${cron} ]] && rm ${cron}
    ;;

  migrate)
    [[ -f ${migrate} ]] && rm ${migrate}
    ;;

  app)
    [[ -f ${app} ]] && rm ${app}
    [[ -f ${nginx} ]] && rm ${nginx}
    if [[ -n "${RUN_CRON}" ]]; then
      echo "-- Running cron inside app container"
      rm ${cron}
    fi;
    ;;

  *)
    echo -n "unknown role"
    ;;
esac
