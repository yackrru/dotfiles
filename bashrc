# common
source ~/.commonrc

# git
source ~/.git-completion.bash

# prompt
PS1_COLOR_BEGIN="\[\e[0;33m\]"
PS1_COLOR_END="\[\e[m\]"
PS2_COLOR_BEGIN="\[\e[0;37m\]"
PS2_COLOR_END="\[\e[m\]"
export PS1="${PS1_COLOR_BEGIN}\w${PS1_COLOR_END}${PS2_COLOR_BEGIN}\$ ${PS2_COLOR_END}"

# enable fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Kubernetes
source <(kubectl completion bash)
