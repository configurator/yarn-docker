# yarn-docker

This repository allows running yarn (and node) in a docker image, as a specified user id.

Each uid needs its own image, so we only have a limited selection of uids, but most common uids are available:

* 0
* 100..110
* 500..510
* 1001..1010

## Usage

Recommended usage is using a bash alias:

    alias yarn='docker run -it --rm -v "$HOME:$HOME" -w "$PWD" "configurator/yarn:$(id -u)" --prefer-offline'

This assumes all projects are somewhere inside `$HOME`.

You could also use `-v "$PWD:$PWD"` instead of `-v "$HOME:$HOME"`, but then local dependencies (e.g. `file:../lib`) will not work.

## Building

To build all common uids, simply run build.sh. To use a different repository name, or different uid numbers, edit `build.sh` first.

e.g. to build yarn:777, edit the two lines

    repo=configurator/yarn
    for uid in 0 {100..110} {500..510} {1001..1010}; do

to

    repo=yarn
    for uid in 777; do

You may also specify a uid (or more than one) in the commandline to build.sh

    ./build.sh 777 888 999
