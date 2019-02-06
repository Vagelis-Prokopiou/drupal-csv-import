#!/bin/bash

drush sql-drop -y;
zcat *.sql.gz | drush sql-cli;