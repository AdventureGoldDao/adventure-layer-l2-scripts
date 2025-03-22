# adveunture-layer-l2-replica-scripts


### copy sequencer config and l1keystore 
```shell
docker cp $sequencer_id:/config ./
docker cp $sequencer_id:/home/user/l1keystore ./

export L2_FEED_URL=wss://sequencer_url:9642
```
