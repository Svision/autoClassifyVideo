#!/bin/bash
# Function to replace spaces, '(', ')', '[', and ']' with '.', and remove the last '.'
format_dir_name() {
  local dir="$1"
  # Replace characters
  dir="${dir//(/ }"  # Remove '('
  dir="${dir//)/ }"  # Remove ')'
  dir="${dir//[/ }"  # Remove '['
  dir="${dir//]/ }"  # Remove ']'

  # Replace consecutive spaces with a single '.'
  dir="${dir//   /.}"
  dir="${dir//  /.}"
  dir="${dir// /.}"

  # Check if the second last character is a '.'
  if [ "${dir: -2:1}" = "." ]; then
    # Remove the second last '.'
    dir="${dir%??}/"
  fi

  echo "$dir"
}

for dir in /volume1/downloads/*/ ; do
  if [[ "$dir" == *"@eaDir"* ]]; then
	continue
  fi
  new_dir=$(format_dir_name "$dir")  # Format dir name
  mv "$dir" "$new_dir"  # Rename the directory
  dir=$new_dir
  if [[ "$dir" == *"S0"* ]] || [[ "$dir" == *"S1"* ]]; then # tv show has session number
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
    mv "$dir" "$mv_to"
  else
    mv "$dir" "/volume1/video/Movies/"
  fi
done
