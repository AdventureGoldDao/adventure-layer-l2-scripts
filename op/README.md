# op

### init
```bash
./init_env.sh 
cp .envrc.example .envrc
```
Fund the addresses
You will need to send ETH to the Admin, Proposer, and Batcher addresses. The exact amount of ETH required depends on the L1 network being used. You do not need to send any ETH to the Sequencer address as it does not send transactions.

It's recommended to fund the addresses with the following amounts when using Sepolia:

Admin — 1 Sepolia ETH
Proposer — 1 Sepolia ETH
Batcher — 1 Sepolia ETH

### update config run
```bash
sudo apt install direnv
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
source ~/.bashrc

vim .envrc
direnv allow
```

### sequencer
```bash
cd ./sequencer-node
#init
./init.sh
#run
./run-all.sh
#stop
./stop.sh
```

### replica
```bash
vim .envrc 
# set P2P_STATIC
direnv allow

cd ./replica-node

vim config.tmol 
# set Node.P2P.StaticNodes

#init
./init.sh
#run
./run-all.sh
#stop
./stop.sh
```
