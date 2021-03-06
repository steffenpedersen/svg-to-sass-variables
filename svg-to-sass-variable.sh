#!/bin/bash

# Get the source name
function get_source_name() {
    echo $1 | cut -d'.' -f 1 | rev | cut -d'/' -f 1 | rev
}

# Remove lines breaks and white spaces
function trim_content() {
    tr  -s '\n' ' ' < $1
}

# Create the Sass variable
function create_sass_variable() {
    source_name=$( get_source_name "$1" )
    icon_source=$( trim_content "$1" )
    printf "\$svg-%s: \'%s\';\n" "$source_name" "$icon_source"
}

# Make a Sass variable for each SVG file
function create_sass_variables_from_svg() {
    for svg_file in $(find $1 -type f -iname "*.svg")
    do
        create_sass_variable $svg_file >> $target_file
    done
}

# Define target file
if [ -z $1 ]; then
   echo "Please define a target file"
else
    target_file="$1"
fi

# Clear the existing file
> $target_file

# Print comments
printf "// =============================================================================\n" >> $target_file
printf "// SVG TO SASS VARIABLES\n" >> $target_file
printf "// =============================================================================\n" >> $target_file
printf "// This file is automatically generated from svg-to-sass-variable.sh\n\n" >> $target_file

# Run function with import argument
if [ -z $2 ]; then
    echo "Please define a input directory"
else
    create_sass_variables_from_svg "$2"
    echo "Your variables is located at $1"
fi
