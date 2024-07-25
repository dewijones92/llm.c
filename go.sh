#!/bin/bash
set -ex

make train_gpt2fp32cu

# Define the preferred order of executables
executables=("train_gpt2_cuda" "train_gpt2_fp32" "train_gpt")

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

# Run the training command
$TRAIN_CMD \
    -i "../../edu_fineweb10B/train.bin" \
    -j "../../edu_fineweb10B/val.bin"**