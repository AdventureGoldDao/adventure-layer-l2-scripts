echo "== Running op-batcher script"
nohup  ../build/op-batcher \
--l2-eth-rpc=http://localhost:8515 \  # L2 Ethereum RPC endpoint
--rollup-rpc=http://localhost:8517 \  # Rollup node RPC endpoint
--poll-interval=20s \                 # Interval for polling in seconds
--sub-safety-margin=6 \               # Safety margin for submissions
--num-confirmations=1 \               # Number of confirmations required
--safe-abort-nonce-too-low-count=3 \  # Safe abort count for nonce too low
--resubmission-timeout=30s \          # Timeout for resubmission
--rpc.addr=0.0.0.0 \                  # RPC server address
--rpc.port=8518 \                     # RPC server port
--rpc.enable-admin \                  # Enable admin RPC
--max-channel-duration=1500 \         # Maximum channel duration
--wait-node-sync=true \               # Wait for node synchronization
--l1-eth-rpc=$L1_RPC_URL \            # L1 Ethereum RPC URL
--private-key=$GS_BATCHER_PRIVATE_KEY \ # Private key for the batcher
 > ./log/batcher.log &                # Redirect output to log file
