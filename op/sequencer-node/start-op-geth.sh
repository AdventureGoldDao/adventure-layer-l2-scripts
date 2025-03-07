# Print a message indicating the script is starting
echo "== Running op-geth script"

# Run the geth command with specified options in the background
nohup ../build/geth \
    --config ./config.toml \  # Specify the configuration file
    --verbosity=4 \           # Set the verbosity level to 4
    --gcmode=archive \        # Use archive mode for garbage collection
    --nat=none \              # Disable NAT
    > ./log/geth.log &        # Redirect output to a log file and run in the background
