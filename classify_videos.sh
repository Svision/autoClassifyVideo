#!/bin/bash
for dir in /volume1/downloads/*/ ; do
  if [[ $dir == *"@eaDir"* ]]; then
	:
  elif [[ $dir == *"S0"* ]] || [[ $dir == *"S1"* ]]; then # tv show has session number
    full="${dir%"${dir##*[!/]}"}"
    full="${full##*/}" # get name without absolute path
    searchstring="S0"
    rest=${full#*$searchstring}
    name_index=$(( ${#full} - ${#rest} - ${#searchstring} )) # before session number
    name=${full:0:$((name_index-1))}
    name=${name//./ } # replace . to <space>
    
    mv_to="/volume1/video/TV Shows/${name}"
    if [ ! -d "$mv_to" ]; then # check if path exist
      mkdir "$mv_to"
    fi
    mv $dir "$mv_to"
  else
    mv $dir "/volume1/video/Movies/"
  fi
done
