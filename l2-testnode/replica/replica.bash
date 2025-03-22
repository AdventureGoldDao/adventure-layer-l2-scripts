#!/usr/bin/env bash

set -eu

NITRO_NODE_VERSION=offchainlabs/nitro-node:v3.5.2-33d30c0
export NITRO_NODE_VERSION
echo "Using NITRO_NODE_VERSION: $NITRO_NODE_VERSION"


run=true
detach=false
force_init=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --init)
            if ! $force_init; then
                echo == Warning! this will remove all previous data
                read -p "are you sure? [y/n]" -n 1 response
                if [[ $response == "y" ]] || [[ $response == "Y" ]]; then
                    force_init=true
                    echo
                else
                    exit 0
                fi
            fi
            shift
            ;;
        --detach)
            detach=true
            shift
            ;;
        *)
            echo Usage: $0 \[OPTIONS..]
            echo        $0 script [SCRIPT-ARGS]
            echo
            echo OPTIONS:
            echo --init            remove all data, rebuild, deploy new rollup
            echo --detach          detach from nodes after running them
            echo
            echo script runs inside a separate docker. For SCRIPT-ARGS, run $0 script --help
            exit 0
    esac
done

NODES="sequencer"
INITIAL_SEQ_NODES="sequencer"

if [[ "$(docker images -q nitro-replica-node:latest 2> /dev/null)" == "" ]]; then
    if [[ ! -d "config" ]] || [[ ! -d "l1keystore" ]]; then
        echo "error, config and l1keystore directory does not exist！" >&2
        exit 1
    fi
    echo == docker pull nitro
    docker pull $NITRO_NODE_VERSION
    docker tag $NITRO_NODE_VERSION nitro-replica-node
fi

if [[ -z "$L2_FEED_URL" ]] || ! [[ "$L2_FEED_URL" =~ ^wss?:// ]]; then
    echo "error：L2_FEED_URL is not WebSocket URL" >&2
    exit 1
fi

if $force_init; then
    docker compose down
        leftoverContainers=`docker container ls -a --filter label=com.docker.compose.project=replica -q | xargs echo`
        if [ `echo $leftoverContainers | wc -w` -gt 0 ]; then
            docker rm $leftoverContainers
        fi
        docker volume prune -f --filter label=com.docker.compose.project=replica
        leftoverVolumes=`docker volume ls --filter label=com.docker.compose.project=replica -q | xargs echo`
        if [ `echo $leftoverVolumes | wc -w` -gt 0 ]; then
            docker volume rm $leftoverVolumes
        fi

    docker compose up --wait $INITIAL_SEQ_NODES
fi

if $run; then
    UP_FLAG=""
    if $detach; then
        UP_FLAG="--detach"
    fi

    echo == Launching Sequencer
    echo if things go wrong - use --init to create a new chain
    echo

    docker compose up $UP_FLAG $NODES
fi
