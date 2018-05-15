#!/bin/bash

repo=configurator/yarn
if [ $# -gt 0 ]; then
    uids=("$@")
else
    uids=(0 {100..110} {500..510} {1001..1010})
fi

for uid in ${uids[@]}; do
    docker build . -t "$repo:$uid" --build-arg "uid=$uid"
    docker push "$repo:$uid"
done
