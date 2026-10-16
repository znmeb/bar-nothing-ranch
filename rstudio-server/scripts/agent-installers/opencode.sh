#! /usr/bin/env -S bash -l

set -eu

# https://opencode.ai/
echo "..Fixing warnings"
npm config set allow-scripts=opencode-ai --location=user
echo "..Installing OpenCode"
npm i -g opencode-ai
echo "..OpenCode is installed."
