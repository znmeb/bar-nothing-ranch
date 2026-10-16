#! /usr/bin/env -S bash -l

set -eu

# https://opencode.ai/
echo "..Fixing warnings"
npm config set allow-scripts=opencode-ai --location=user
npm install -g npm@12.2.0
echo "..Installing OpenCode"
npm i -g opencode-ai
echo "..OpenCode is installed."
