#!/usr/bin/env bash

PATH="/opt/homebrew/bin:$PATH"
PATH="/usr/local/bin:$PATH"
BREW_HOME=$(brew --prefix)
BREW_BIN=$BREW_HOME/bin

# enable fzf
$BREW_HOME/opt/fzf/install --key-bindings --completion --no-update-rc

# Configure
install commonrc ~/.commonrc
install bash_profile ~/.bash_profile
install bashrc ~/.bashrc
install zshrc ~/.zshrc
install screenrc ~/.screenrc
install -d ~/bin
# install .tool-versions ~/.tool-versions

# git
curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
install $BREW_HOME/share/git-core/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight
install gitattributes ~/.gitattributes
install gitignore ~/.gitignore
install gitconfig ~/.gitconfig
install gituser.sh ~/.gituser.sh

# Restart shell
echo -n -e "Finish install dotenvs!\n"
exec $SHELL -l
