#!/bin/bash

repo=configurator/yarn

for uid in 0 {100..110} {500..510} {1001..1010}; do
    docker build . -t "$repo:$uid" --build-arg "uid=$uid"
    docker push "$repo:$uid"
done
