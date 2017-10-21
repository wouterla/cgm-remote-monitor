#!/bin/bash
source $2

var_value() {
    eval echo \$$1
}

lines=$(cat $1)
for line in $lines;
do
  var=$(echo ${line} | grep -oE '\{\{[A-Za-z0-9_]+\}\}' | sed -e 's/^{{//' -e 's/}}$//')
  if [[ ! -z "${var}" ]];
  then
    # echo "$var=$(var_value ${var})"
    value=$(var_value ${var})
    esc_value=$(echo "${value}" | sed 's/\//\\\//g');
    echo ${esc_value}
    new_line=$(echo ${line} | sed -e "s/{{$var}}/${esc_value}/g")
    echo ${line}
    echo ${new_line}
  fi
done
