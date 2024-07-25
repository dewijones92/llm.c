set -ex;

make train_gpt2fp32cu

# train on a single GPU
./train_gpt2cu \
    -i "dev/data/fineweb10B/fineweb_train_*.bin" \
    -j "dev/data/fineweb10B/fineweb_val_*.bin" 