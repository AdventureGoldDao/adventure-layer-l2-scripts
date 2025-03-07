# Print a message indicating the script is starting
echo "== Running op-geth script"

# Run the geth command with specified options in the background
nohup ../build/geth \
    --config ./config.toml \
    --verbosity=4 \
    --gcmode=archive \
    --nat=none \
    > ./log/geth.log &
