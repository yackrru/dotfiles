# common
source ~/.commonrc

# colors
autoload -U colors
colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt extended_history

# enable edit befor exec history
setopt hist_verify

# Share history between zsh processes
setopt share_history

# no beep
setopt no_beep

# no beep at completion
setopt nolistbeep

# enable to display filename of Japanese
setopt print_eight_bit

# change dir without cd command
setopt auto_cd

# change dir using history (cd -<TAB>)
DIRSTACKSIZE=100
setopt auto_pushd
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

# completion command options
fpath=(/path/to/homebrew/share/zsh-completions $fpath)
autoload -U compinit
compinit -u

# case insensitive in completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# delete path in '/' units with <C-w>
autoload -U select-word-style
select-word-style bash

# check before exec rm *
setopt rmstar_wait

# don't logout with <C-d>
setopt ignoreeof

# enable extended glob
setopt extended_glob

# walk around completion candidates with vim binding
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# display with candidates packed
setopt list_packed

# search history with <C-p> or <C-n>
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kubernetes
source <(kubectl completion zsh)
