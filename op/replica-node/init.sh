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

rm -rf ./log ./opnode_discovery_db ./opnode_peerstore_db ./datadir opnode_p2p_priv.txt *.zip
mkdir log
../build/geth init --state.scheme=hash --datadir=./datadir ../config/genesis.json
