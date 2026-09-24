#!/bin/bash

set -euxo pipefail

dnf -y --enable-repo terra install git lazygit difftastic git-delta
