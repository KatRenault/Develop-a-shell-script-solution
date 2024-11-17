#!/bin/bash

# Author: Kat Renault
# Description: This script searches for a given name pattern in input text.
#     If a replacement is provided, it replaces all occurrences of the name pattern with the replacement text.
#     Outputs: 
#       - grep version: lines that match the name pattern.
#       - awk/sed version: lines with replaced name patterns.

# Check if the correct number of arguments is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <name-pattern> [replacement-text]" >&2
    exit 1
fi

name_pattern=$1

# Define the replacement text (optional), default to empty if not provided
replacement_text=$2

if [ -z "$replacement_text" ]; then
    echo "Using grep to find lines with the name pattern '$name_pattern':"
    grep "$name_pattern" 
else
    echo "Using sed to replace occurrences of '$name_pattern' with '$replacement_text':"
    sed "s/$name_pattern/$replacement_text/g" 
fi
