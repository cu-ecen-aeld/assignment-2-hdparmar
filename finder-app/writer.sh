#!/bin/bash

writefile="${1}"
writestr="${2}"


# check both arguments are provided
if [ -z "$writefile" ] || [ -z $"writestr" ]; then
	echo "Error: Both file path and text string arguments should be provided."
	exit 1
fi


# Ensure the provided filepath is not just a directory (ends with '/')
if [[ "$writefile" == */ ]]; then
	echo "Error: The file path '$writefile' should not end with a slash (indicating a directory)."
	exit 1
fi



# extract the directory path from the full file path
writedir=$(dirname "$writefile")

# create the directory if it does not exists
mkdir -p "$writedir" || {
	echo "Error: Could not create directory path '$writedir'"
	exit 1
}

# write the text string to the file, overwriting if it exists
echo "$writestr" > "$writefile" || {
	echo "Error: Could not write to file '$writefile'"
	exit 1
}

echo "Successfully written '$writestr' to the file '$writefile'"


