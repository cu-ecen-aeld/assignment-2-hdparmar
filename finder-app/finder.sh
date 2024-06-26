#!/bin/bash

filesdir=$1
searchstr=$2

# check if any of the arguments were not specified
if [ $# -ne 2 ]; then
	echo "Error: Required two arguments: <path to directory on filesystem> <text string to be search within filesdir>"
	exit 1
fi

# check if filesdir does not represent a directory on the filesystem
if [ ! -d "$filesdir" ]; then
	echo "Error $filesdir is not a directory"
	exit 1
fi

# find the number of files in filesdir and its subdirectory
total_files=$(find "$filesdir" -type f | wc -l)

# find the number of files matching the search string
total_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# print the message
echo "The number of files are $total_files and the number of matching lines are $total_matching_lines"
