#!/bin/bash

LOG="/var/log/apache2/heyderebub.com_access.log"
LASTREAD=/var/www/heyderebub.com/public_html/.goaccess.last

OFFSET=$(sed -n '$=' $LOG)

START=1

if [[ -s $LASTREAD ]]; then
  START=$(<$LASTREAD)
  START="$(($START + 1))"
fi

sed -n $START','$OFFSET'p' < $LOG
echo "$OFFSET" > "$LASTREAD"

