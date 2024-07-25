#!/bin/bash
set -ex

make

# Define the preferred order of executables
executables=("train_gpt2_cuda" "train_gpt2_fp32" "train_gpt2")

# Find the first available executable
for exe in "${executables[@]}"; do
    if [ -x "./$exe" ]; then
        TRAIN_CMD="./$exe"
        break
    fi
done

# Check if a suitable executable was found
if [ -z "$TRAIN_CMD" ]; then
    echo "Error: No suitable training executable found."
    exit 1
fi

# Extract the base path
BASE_PATH="../../edu_fineweb10B"

# List everything in the base path
ls -la $BASE_PATH

# Run the training command
$TRAIN_CMD \
    -i "$BASE_PATH/train.bin" \
    -j "$BASE_PATH/val.bin"