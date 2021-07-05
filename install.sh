#!/usr/bin/env bash
BREW_BIN=$(brew --prefix)/bin

# SDKMAN
if [ ! -d ~/.sdkman ]; then
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  exec $SHELL -l
fi

# anyenv
if [ ! -d ~/.anyenv ]; then
  $BREW_BIN/anyenv install --init
  exec $SHELL -l
fi
if [ ! -d ~/.anyenv/envs/goenv ]; then
  $BREW_BIN/anyenv install goenv
  exec $SHELL -l
fi

# enable fzf
/usr/local/opt/fzf/install --key-bindings --completion --no-update-rc

# Configure
install commonrc ~/.commonrc
install bash_profile ~/.bash_profile
install bashrc ~/.bashrc
install zshrc ~/.zshrc
install screenrc ~/.screenrc
install -d ~/bin

# git
curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
install /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight
install gitattributes ~/.gitattributes
install gitignore ~/.gitignore
install gitconfig ~/.gitconfig

# Restart shell
echo -n -e "Finish install dotenvs!\n"
exec $SHELL -l
