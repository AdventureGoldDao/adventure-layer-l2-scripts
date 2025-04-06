# adveunture-layer-l2-scripts

### Prerequisites

#### 1. Docker
```shell
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do 
  sudo apt-get remove $pkg
done

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx

sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker
# check
docker version
```
#### 2. docker-compose
```shell
sudo mkdir -p /usr/libexec/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-linux-x86_64 -o /usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose
sudo ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose

# check
docker compose version
```
#### 3. direnv
```shell
sudo apt-get install -y direnv
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
source ~/.bashrc
# check
direnv version
```

### clone code
```bash
git clone --branch adventure-layer-main  git@github.com:AdventureGoldDao/adventure-layer-l2-scripts.git
cd adventure-layer-l2-scripts/l2-testnode
```

### Write configuration file
example:
```
export L1_RPC_URL=wss://bepolia.rpc.berachain.com
export L1_HTTP_RPC_URL=https://bepolia.rpc.berachain.com
export L1_CHAIN_ID=80069
```

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

### It's recommended to fund the addresses with the following amounts when using l1 ETH

| account   | eth | desc                   |
|-----------|-----|------------------------|
| l2owner   | 2   | The owner of the chain |
| sequencer | 1   | Package submitter      |
| validator | 1.1 | validator              |

```shell
#echo == send-l1 validator ./test-node.bash Every time an automatic call is executed
#./test-node.bash script send-l1 --ethamount 1.1 --from l2owner --to validator --wait
echo == send-l1 sequencer
./test-node.bash script send-l1 --ethamount 1 --from l2owner --to sequencer --wait
```

Initialize the node 
```bash
./test-node.bash --init --detach
```




