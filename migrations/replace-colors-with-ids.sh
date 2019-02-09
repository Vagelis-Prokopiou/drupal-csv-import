#!/usr/bin/env bash

rm ./cars.csv 2> /dev/null;
cp ./cars-with-colors.csv ./cars.csv;

cat colors.csv | while read line; do
    id=$(echo $line | cut -d',' -f1);
    color=$(echo $line | cut -d',' -f2);
    
    if [ $id != '"id"' ]; then
        sed -i "s/$color/$id/" ./cars.csv;
     fi
done;
