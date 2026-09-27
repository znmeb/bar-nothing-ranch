#! /bin/bash -l

set -eu

source set-installer-envars
export LOGFILE=$HOME/Logfiles/ai-tools.log
rm --force $LOGFILE

echo "....Activating Homebrew PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "....Installing coding agents"
brew trust anomalyco/tap
brew install --yes --quiet \
  block-goose-cli \
  anomalyco/tap/opencode \
  pi-coding-agent \
  >> $LOGFILE 2>&1
brew install --yes --quiet --cask \
  claude-code \
  codex \
  >> $LOGFILE 2>&1

echo "....Cleaning up"
brew cleanup --prune all --scrub --quiet \
  >> $LOGFILE 2>&1

echo "....Finished"
echo ""
