#!/bin/bash
FILES="`dirname "$0"`/translation_list_*.txt"
PATHS=`awk -F';' 'NF && $0!~/^#/{print $2}' $FILES`

for p in $PATHS; do
  if [ -f $p ]; then
    git checkout master -- "${p/.properties/_*.properties}"
    git checkout master -- "${p/.xml/.*.xml}"
  fi
done
