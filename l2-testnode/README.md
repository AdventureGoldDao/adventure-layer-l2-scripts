# adveunture-layer-l2-scripts

### clone code
```bash
git clone --branch adventure-layer-main  git@github.com:AdventureGoldDao/adventure-layer-l2-scripts.git
cd adventure-layer-l2-scripts/l2-testnode
```

### Write configuration file
```shell
cp .envrc.example .envrc

direnv allow
```

### look address
```shell
./test-node.bash script print-address --account sequencer
```

### look address private-key
```shell
./test-node.bash script print-private-key --account l2owner
```

Initialize the node 
```bash
./test-node.bash --init
```

### Extract tokens from L1 erc20 to L2
```shell
# cat tokenAddress is native-token in: docker compose run --entrypoint sh scripts -c "cat /config/deployment.json"  
 ./test-node.bash script transfer-erc20 -l1 --token 0x***********Cf13dd6706 --amount 1000 --from l2owner --to sequencer

 ./test-node.bash script bridge-native-token-to-l2 --amount 5 --from l2owner --wait
```

### L2 token trading
```bash
./test-node.bash script send-l2 --to address_0x1111222233334444555566667777888899990000
```

For help and further scripts, see:
```bash
./test-node.bash script --help
```

### cat config
```shell
docker compose run --entrypoint sh sequencer -c "ls /config"
```

### up l1 gas config
```shell
cast send 0x0000000000000000000000000000000000000070 "SetL1PricePerUnit(uint256)" 0 --private-key l2ownerprvkey --rpc-url http://127.0.0.1:8547
cast send 0x0000000000000000000000000000000000000070 "SetL1PricingRewardRate(uint64)" 0 --private-key l2ownerprvkey --rpc-url http://127.0.0.1:8547
```

# When shutting down the Docker image, it is important to allow a graceful shutdown to save the current state to disk. Here is an example of how to do a graceful shutdown of all docker images currently running
```shell
docker stop --time=1800 $(docker ps -aq)
```

