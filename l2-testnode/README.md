# adveunture-layer-l2-scripts

### clone code
```bash
git clone git@github.com:AdventureGoldDao/adventure-layer-l2-scripts.git
cd adventure-layer-l2-scripts/l2-testnode
```

### up env
```shell
cp .envrc.example .envrc
```

```shell
direnv allow
```

### look address
```shell
./run_l2.bash script print-address --account validator
```

### look address private-key
```shell
./run_l2.bash script print-private-key --account sequencer
```

Initialize the node 
```bash
./test-node.bash --init --l2-fee-token --tokenbridge
```

```bash
./test-node.bash script send-l2 --to address_0x1111222233334444555566667777888899990000
```

For help and further scripts, see:

```bash
./test-node.bash script --help
```

## Named accounts

```bash
# Set L1 eth > 4 
./test-node.bash script print-address --account funnel
```

```bash
./test-node.bash script print-private-key --account user_token_bridge_deployer
```

### cat config
```shell
docker compose run --entrypoint sh sequencer -c "ls /config"
```

### 
```shell
# cat tokenAddress is native-token in: docker compose run --entrypoint sh scripts -c "cat /config/l3deployment.json"  
 docker compose run scripts transfer-erc20 -l1 --token 0x***********Cf13dd6706 --amount 1000 --from user_fee_token_deployer --to l2owner

 docker compose run scripts bridge-native-token-to-l2 --amount 100 --from l2owner --wait
```
