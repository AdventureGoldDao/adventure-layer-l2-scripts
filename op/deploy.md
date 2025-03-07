# L2 Rollup Deployment Guide

This guide will help you create and deploy an L2 Rollup o. Please ensure you have the necessary environment and tools.

## Software dependencies

Before you start, make sure you have the following:

- git ^2 (check version with `git --version`)
- go ^1.21 (check version with `go version`)
- node ^20 (check version with `node --version`)
- pnpm ^8 (check version with `pnpm --version`)
- foundry ^0.2.0 (check version with `forge --version`)
- make ^3 (check version with `make --version`)
- jq ^1.6 (check version with `jq --version`)
- direnv ^2 (check version with `direnv --version`)
```bash
sudo apt install direnv
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
source ~/.bashrc

vim .envrc
direnv allow
```

## Step 1: Clone the Repository

First, clone the adventure-layer-l2-scripts repository:

```bash
git clone https://github.com/AdventureGoldDao/adventure-layer-l2-scripts.git
cd adventure-layer-l2-scripts
```

## Step 2: Check Software Dependencies

Run the following script and double check that you have all of the required versions installed. If you don't have the correct versions installed, you may run into unexpected errors.

```bash
./op/versions.sh
```

## Step 3: Generate .envrc file 

Run the following command in the root directory of the project to generate the .envrc file:

```bash
./init_env.sh
cp .envrc.example .envrc
```
### Fund the Addresses

You will need to send ETH to the Admin, Proposer, and Batcher addresses. The exact amount of ETH required depends on the L1 network being used. You do not need to send any ETH to the Sequencer address as it does not send transactions.

It's recommended to fund the addresses with the following amounts when using Sepolia:

- **Admin** — 1 Sepolia ETH
- **Proposer** — 1 Sepolia ETH
- **Batcher** — 1 Sepolia ETH


## Step 3: Configure Environment Variables

Create a `.env` file and configure the following environment variables as needed:

```plaintext
L1_RPC_URL=<Your L1 RPC URL>
L2_RPC_URL=<Your L2 RPC URL>
PRIVATE_KEY=<Your Private Key>
```


## Step 4: Start Sequencer

Before starting the Sequencer, ensure that you have correctly configured the environment variables and all required services are running. You can start the Sequencer using the following command:

```bash
cd ./op/sequencer-node
#init
./init.sh
#run
./run-all.sh
#stop
./stop.sh
```

## Step 5: Start Replica

You can deploy a Replica node using the following steps

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


## References

- [GitHub Repository](https://github.com/AdventureGoldDao/adventure-layer-l2)
