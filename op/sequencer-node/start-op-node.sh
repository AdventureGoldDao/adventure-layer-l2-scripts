echo "== Running op-node script"
nohup ../build/op-node \
--l2=http://localhost:8521 \
--l2.jwt-secret=./jwt.txt \
--sequencer.enabled \
--sequencer.l1-confs=5 \
--verifier.l1-confs=4 \
--rollup.config=../config/rollup.json \
--rpc.addr=0.0.0.0 --rpc.port=8517  --rpc.enable-admin \
--l1=$L1_RPC_URL --l1.rpckind=alchemy \
--syncmode=consensus-layer \
--p2p.sequencer.key=$GS_SEQUENCER_PRIVATE_KEY \
--p2p.listen.tcp=8505 \
--p2p.listen.udp=8505 \
> ./log/node.log &
