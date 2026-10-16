#! /bin/bash -l

set -eu

export LOGFILE=$HOME/Logfiles/command-line-base.log
rm --force $LOGFILE

pushd /tmp > /dev/null
    echo "..Installing Rust toolchain"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install-rust.sh
    chmod +x install-rust.sh
    ./install-rust.sh -y \
        >> $LOGFILE 2>&1

    echo "..Installing Node.js"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash \
        >> $LOGFILE 2>&1
    \. "$HOME/.nvm/nvm.sh" \
        >> $LOGFILE 2>&1
    nvm install 26 \
        >> $LOGFILE 2>&1
    npm install -g npm@12.2.0 \
        >> $LOGFILE 2>&1
    node -v
    npm -v

    popd > /dev/null

echo "..Installing Homebrew"
NONINTERACTIVE=1 /bin/bash -c \
  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  >> $LOGFILE 2>&1

if [[ "$(grep linuxbrew $HOME/.bashrc 2> /dev/null | wc -l)" == "0" ]]
then
  echo "..Adding Homebrew init to the command line"
  echo "" >> $HOME/.bashrc
  echo \
    'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' \
    >> $HOME/.bashrc

fi

echo "..Activating Homebrew PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

echo "..Installing brew packages"
brew install --yes --quiet \
  font-caskaydia-cove-nerd-font \
  neovim \
  ripgrep \
  starship \
  >> $LOGFILE 2>&1

echo "..Cleaning up"
brew cleanup --prune all --scrub --quiet \
  >> $LOGFILE 2>&1

echo "..Setting neovim configuration files"
mkdir --parents $HOME/.config
cp -rp nvim $HOME/.config

echo "..Setting starship configuration file"
cp starship.toml $HOME/.config/

if [[ "$(grep starship $HOME/.bashrc | wc -l)" == 0 ]]
then
  echo "..Appending starship init to $HOME/.bashrc"
  echo "" >> $HOME/.bashrc
  echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

fi

if [[ "$(grep 'end aliases' $HOME/.bashrc | wc -l)" == 0 ]]
then

echo "..Appending aliases to $HOME/.bashrc"
cat << ALIASES_END >> $HOME/.bashrc

# begin aliases
# make sure \$HOME/.local/bin is in \$PATH
if [[ ! "\$PATH" =~ "\$HOME/.local/bin" ]]
then
  export PATH="\$HOME/.local/bin:\$PATH"
fi

alias l='ls -CF --color=auto'
alias ll='ls -Fltr'
alias la='ls -FAltr'
alias vi=nvim
alias vim=nvim

export EDITOR=nvim
export VISUAL=nvim
# end aliases

ALIASES_END

fi

echo "..Setting $HOME/.Rprofile and $HOME/.Renviron"
cp Rprofile $HOME/.Rprofile
cp Renviron $HOME/.Renviron

echo "..Finished"
echo ""
