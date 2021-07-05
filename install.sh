#!/usr/bin/env bash

# brew
brew bundle
anyenv install --init
exec $SHELL -l

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# anyenv
anyenv install goenv
exec $SHELL -l

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
curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
chmod a+x ~/.git-completion.bash
curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -O ~/.git-completion.zsh
chmod a+x ~/.git-completion.zsh
curl -sSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
install /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight
install gitattributes ~/.gitattributes
install gitignore ~/.gitignore
install gitconfig ~/.gitconfig

# Restart shell
exec $SHELL -l
