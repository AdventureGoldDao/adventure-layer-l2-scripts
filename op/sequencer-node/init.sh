if [ ! -f "../build/geth" ]; then
  wget -L https://github.com/AdventureGoldDao/optimism/releases/download/v1.9.1/geth.zip
  unzip geth.zip -d ../build
  chmod +x ../build/geth
fi

if [ ! -f "../build/op-node" ]; then
  wget -L https://github.com/AdventureGoldDao/optimism/releases/download/v1.9.1/op-node.zip
  unzip op-node.zip -d ../build
  chmod +x ../build/op-node
fi

if [ ! -f "../build/op-proposer" ]; then
  wget -L https://github.com/AdventureGoldDao/optimism/releases/download/v1.9.1/op-proposer.zip
  unzip op-proposer.zip -d ../build
  chmod +x ../build/op-proposer
fi

if [ ! -f "../build/op-batcher" ]; then
  wget -L https://github.com/AdventureGoldDao/optimism/releases/download/v1.9.1/op-batcher.zip
  unzip op-batcher.zip -d ../build
  chmod +x ../build/op-batcher
fi

rm -rf ./log/* ./opnode_discovery_db ./opnode_peerstore_db ./datadir *.zip
mkdir log
../build/geth init --state.scheme=hash --datadir=./datadir ../config/genesis.json
