#!/bin/bash
for dir in /volume1/downloads/*/ ; do
  if [[ $dir == *"@eaDir"* ]]; then
	:
  elif [[ $dir == *"S0"* ]] || [[ $dir == *"S1"* ]]; then # tv show has session number
    full="${dir%"${dir##*[!/]}"}"
    full="${full##*/}"
    searchstring="S0"
    rest=${full#*$searchstring}
    name_index=$(( ${#full} - ${#rest} - ${#searchstring} )) # before session number
    name=${full:0:$((name_index-1))}
    name=${name//./ }
    
    mv_to="/volume1/video/TV Shows/${name}"
    if [ ! -d "$mv_to" ]; then
      mkdir "$mv_to"
    fi
    mv $dir "$mv_to"
  else
    mv $dir "/volume1/video/Movies/"
  fi
done
