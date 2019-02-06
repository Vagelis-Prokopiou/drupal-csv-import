#!/bin/bash

if ls ./*.sql.gz 1> /dev/null 2>&1; then
    rm *.sql.gz;
fi

drush sql-query "TRUNCATE watchdog";
drush sql-query "SHOW TABLES LIKE 'cache%'" | while read table; do drush sql-query "TRUNCATE $table"; done;
drush sql-dump | gzip > $(date +%Y-%m-%dT%H:%M).sql.gz;