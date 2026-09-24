#!/bin/bash

set -euxo pipefail

dnf -y --enable-repo terra install 1password 1password-cli
