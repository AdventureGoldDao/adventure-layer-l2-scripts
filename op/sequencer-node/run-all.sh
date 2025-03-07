
echo "== Running all scripts"
./start-op-geth.sh

sleep 5
./start-op-node.sh

sleep 3
./start-op-batcher.sh

sleep 3
./start-op-proposer.sh