#!/bin/bash

OUTPUT_DIR="tzcp"
mkdir -p $OUTPUT_DIR

# get all args to list
args=("$@")

all_files=()
include_dirs=()
for dir_name in "${args[@]}"
do
    include_dirs+=("-I$dir_name")
    # get all .proto file in dir
    proto_files=$(find $dir_name -name "*.proto")
    for file in $proto_files
    do
        all_files+=($file)
    done
done


# generate files
protoc ${include_dirs[@]} ${all_files[@]} --cpp_out=$OUTPUT_DIR --python_out=$OUTPUT_DIR