#!/bin/bash

set -euxo pipefail

dnf -y --enable-repo terra install chafa yazi
