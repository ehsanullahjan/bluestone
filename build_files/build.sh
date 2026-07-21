#!/bin/bash

set -euxo pipefail

/ctx/build_files/pre-build.sh
/ctx/build_files/post-build.sh
