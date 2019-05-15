#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR/docker"

function cleanup {
    cd "$DIR/docker"
    docker-compose down
}
trap cleanup EXIT

docker-compose up --build --detach --remove-orphans
docker-compose run --rm --service-ports shell /bin/bash
