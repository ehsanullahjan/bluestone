#!/bin/bash

set -euxo pipefail

# Copy custom configs
rsync -rvK /ctx/system_files/post-build/ /
