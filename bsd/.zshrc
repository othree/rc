#
setopt prompt_subst

export PROMPT="$(print '%{\e[1;37m%}[%/] -%n- %{\e[0m%}')\
$(print '%{\e[1;30m%}>%{\e[0m%}')\
$(print '%{\e[0;32m%}>%{\e[0m%}')\
$(print '%{\e[1;32m%}>%{\e[0m%}') "
export RPROMPT="$(print '%{\e[1;37m%}[%T]%{\e[0m%}')"

export PATH=$PATH:$HOME/bin

autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

setopt correctall

bindkey "\e[1~" beginning-of-line        # Home
bindkey "\e[7~" beginning-of-line        # Home rxvt
bindkey "\e[2~" overwrite-mode           # Ins
bindkey "\e[3~" delete-char              # Delete
bindkey "\e[4~" end-of-line              # End
bindkey "\e[8~" end-of-line              # End rxvt
bindkey "\e[5~" history-search-backward  # PageUp
bindkey "\e[6~" history-search-forward   # PageDown

export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export LSCOLORS=ExFxCxdxBxegedabagacad

alias ls="ls -G"
alias ll="ls -al"
alias l="ls -l"
alias cls="clear"
alias g='grep'
alias :q='exit'
alias :Q='exit'
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../.././../.."
alias cd.......="cd ../../../../../.."
