#!/bin/bash

# Output the number of files
# in the given directory that
# have the given file extension

# verifying the arguments given
if ! ([ $# -eq 1 ] || [ $# -eq 2 ]) ; then
    echo "usage: $0 directory extension" >&2;
    exit -1
fi

directory=$1;
extension=$2;

# verifying if the first argument is a directory or not
if [ ! -d $directory ]; then
    echo "$directory is not a directory" >&2
    exit -1
fi

if [ "$extension" = "" ]; then
    echo "$(find $directory -maxdepth 1 -type f | wc -l)"
else
    echo "$(find $directory -maxdepth 1 -name *$extension | wc -l)"
fi

exit 0