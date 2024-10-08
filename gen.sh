#!/bin/bash

# echo "Usage: gen.sh [output_dir=tzcp_gen]"
SCRIPT_DIR="$( dirname -- "${BASH_SOURCE[0]}" )"
INPUT_DIR=$SCRIPT_DIR/tzcp
# $1 output dir
if [ -z $1 ]; then
    OUTPUT_DIR="tzcp_gen"
else
    OUTPUT_DIR=$1
fi

echo "input dir  : $INPUT_DIR"
echo "output dir : $OUTPUT_DIR"

mkdir -p $OUTPUT_DIR

dir_name=$INPUT_DIR
all_files=()
include_dirs=()

include_dirs+=("-I$SCRIPT_DIR")
# get all .proto file in dir
proto_files=$(find $dir_name -name "*.proto")
for file in $proto_files
do
    all_files+=($file)
done

# generate files
protoc ${include_dirs[@]} ${all_files[@]} --cpp_out=$OUTPUT_DIR --python_out=$OUTPUT_DIR
