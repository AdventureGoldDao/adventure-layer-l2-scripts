# adveunture-layer-l2-replica-scripts


### copy sequencer config and l1keystore 
```shell
docker compose cp sequencer:/config ./
docker compose cp sequencer:/home/user/l1keystore ./

export L2_FEED_URL=wss://sequencer_url:9642
```
