echo "== Running op-proposer script"
nohup ../build/op-proposer \
--poll-interval=12s --rpc.port=8520 --rollup-rpc=http://localhost:8517 \
--l2oo-address=$L2_OO_ADDRESS \
--private-key=$GS_PROPOSER_PRIVATE_KEY \
--l1-eth-rpc=$L1_RPC_URL \
 > ./log/proposer.log &
