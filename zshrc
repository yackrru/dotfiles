# common
source ~/.commonrc

# colors
autoload -U colors
colors

if [ "$TERM" = "screen" ];then
  chpwd() {
    echo -n "_`dir`\\"
  }
  preexec() {
    emulate -L zsh
    local -a cmd; cmd=(${(z)2})
    case $cmd[1] in
      fg)
        if *1; then
          cmd=(builtin jobs -l %+)
        else
          cmd=(builtin jobs -l $cmd[2])
        fi
        ;;
      %*)
        cmd=(builtin jobs -l $cmd[1])
        ;;
      cd)
        if *2; then
          cmd[1]=$cmd[2]
        fi
        ;;
      *)
        echo -n "k$cmd[1]:t\\"
        return
        ;;
    esac

    local -A jt; jt=(${(kv)jobtexts})

    $cmd >>(read num rest
      cmd=(${(z)${(e):-\$jt$num}})
      echo -n "k$cmd[1]:t\\"
    ) 2>/dev/null
  }

  chpwd
fi

export CLICOLOR=1

function custom_prompt {
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  #local git_branch="$(__git_ps1 "\033[36m[%s]\033[0m")"
  local git_branch="$(__git_ps1 "\033[36m[%s]\033[0m")"

  # user name text color
  local name_t='179m%}' # user name background color
  local name_b='236m%}'
  # path text clolr
  local path_t='255m%}'
  # path background color
  local path_b='031m%}'
  # arrow color
  local arrow='087m%}'
  # set text color
  local text_color='%{\e[38;5;'
  # set background color
  local back_color='%{\e[30;48;5;'
  # reset
  local reset='%{\e[0m%}'

  local user="${back_color}${name_b}${text_color}${name_t}"
  local dir="${back_color}${path_b}${text_color}${path_t}"

  echo "${user}%n@%m${back_color}${path_b}${text_color}${name_b} ${dir}%~${reset}${text_color}${path_b}${reset} ${git_branch} \n${text_color}${arrow}> ${reset}"
}

precmd() {
  NEW_LINE_BEFORE_PROMPT=1
  PROMPT=`custom_prompt`
}

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
rm -f ~/.zcompdump
compinit

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
