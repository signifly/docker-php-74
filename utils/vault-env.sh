#!/usr/bin/env bash

if [[ -d "/vault" ]]
then
    echo "Vault present, loading env variables"
    for f in /vault/secrets/*; do
       echo "Loading: $f"
       export $(grep -v '^#' $f | xargs)
    done
else
    echo "Vault not present"
fi
