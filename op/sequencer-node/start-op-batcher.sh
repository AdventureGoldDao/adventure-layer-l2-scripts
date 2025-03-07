echo "== Running op-batcher script"
nohup  ../build/op-batcher \
--l2-eth-rpc=http://localhost:8515 \
--rollup-rpc=http://localhost:8517 \
--poll-interval=20s \
--sub-safety-margin=6 \
--num-confirmations=1 \
--safe-abort-nonce-too-low-count=3 \
--resubmission-timeout=30s \
--rpc.addr=0.0.0.0 \
--rpc.port=8518 \
--rpc.enable-admin \
--max-channel-duration=1500 \
--wait-node-sync=true \
--l1-eth-rpc=$L1_RPC_URL \
--private-key=$GS_BATCHER_PRIVATE_KEY \
 > ./log/batcher.log &
