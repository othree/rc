#

source ~/.profile

echo -ne "\e]1;[zsh] `hostname`\a" # tab title
echo -ne "\e]2;[zsh] `hostname`\a" # window title

setopt prompt_subst

autoload -Uz vcs_info && vcs_info
zstyle ':vcs_info:*' formats "$(print '%{\e[1;37m%}|')\
$(print '%{\e[38;5;45m%}%s%{\e[1;37m%}:%{\e[38;5;2m%}%b%{\e[0m%}')"
zstyle ':vcs_info:*' actionformats "$(print '%{\e[1;37m%}|')\
$(print '%{\e[38;5;45m%}%s%{\e[1;37m%}:%{\e[38;5;2m%}%b%')\
$(print '%{\e[1;37m%}:%{\e[38;5;46m%}%b%{\e[0m%}')"
precmd () { vcs_info }

export PROMPT="$(print '%{\e[1;37m%}[%{\e[38;5;192m%}%/')\
$(print '${vcs_info_msg_0_}%{\e[1;37m%}] ')\
$(print '%{\e[0m%}-%{\e[1;37m%}%n%{\e[0m%}- ')\
$(print '%1(j.%{\e[38;5;185m%}|%j|%{\e[1;37m%}.)')\
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') "
#$(print '%{\e[38;5;16m%}>')\
#$(print '%{\e[38;5;28m%}>')\
#$(print '%{\e[38;5;40m%}>')\

export PROMPT2="$(print '%{\e[1;37m%}[%{\e[38;5;192m%}%/')\
$(print '${vcs_info_msg_0_}%{\e[1;37m%}] ')\
$(print '%{\e[0m%}-%{\e[1;37m%}%n%{\e[0m%}- ')\
$(print '%1(j.%{\e[38;5;192m%}|%j|%{\e[1;37m%}.)')\
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;28m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;33m%}') %_ \
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;40m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') "

export RPROMPT="$(print '[%(?.%{\e[1;37m%}%T%{\e[0m%}. %{\e[38;5;203m%}%?%{\e[0m%} )]')"
#export RPROMPT="$(print '[ %{\e[1;37m%}%(?.%T.%?)%{\e[0m%} ]')"
#export RPROMPT=$'%(?..[ %B%?%b ])'

export LC_ALL=en_US.UTF-8
export LANG=$LC_ALL
export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history
export JS_CMD="js"

#export LSCOLORS=ExFxCxdxBxegedabagacad
LS_COLORS=''
LS_COLORS=$LS_COLORS:'no=0'           # Normal text       = Default foreground  
LS_COLORS=$LS_COLORS:'fi=0'           # Regular file      = Default foreground
LS_COLORS=$LS_COLORS:'di=38;5;27'       # Directory         = Bold, Blue
LS_COLORS=$LS_COLORS:'ln=01;36'       # Symbolic link     = Bold, Cyan
LS_COLORS=$LS_COLORS:'pi=33'          # Named pipe        = Yellow
LS_COLORS=$LS_COLORS:'so=01;35'       # Socket            = Bold, Magenta
LS_COLORS=$LS_COLORS:'do=01;35'       # DO                = Bold, Magenta
LS_COLORS=$LS_COLORS:'bd=01;37'       # Block device      = Bold, Grey
LS_COLORS=$LS_COLORS:'cd=01;37'       # Character device  = Bold, Grey
LS_COLORS=$LS_COLORS:'ex=35'          # Executable file   = Light, Blue
LS_COLORS=$LS_COLORS:'*FAQ=31;7'      # FAQs              = Foreground Red, Background Black
LS_COLORS=$LS_COLORS:'*README=33;7'   # READMEs           = Foreground Red, Background Black
LS_COLORS=$LS_COLORS:'*INSTALL=31;7'  # INSTALLs          = Foreground Red, Background Black
LS_COLORS=$LS_COLORS:'*.sh=47;31'     # Shell-Scripts     = Foreground White, Background Red
LS_COLORS=$LS_COLORS:'*.vim=35'       # Vim-"Scripts"     = Purple
LS_COLORS=$LS_COLORS:'*.swp=00;44;37' # Swapfiles (Vim)   = Foreground Blue, Background White
LS_COLORS=$LS_COLORS:'*.sl=30;33'     # Slang-Scripts     = Yellow
LS_COLORS=$LS_COLORS:'*,v=5;34;93'    # Versioncontrols   = Bold, Yellow
LS_COLORS=$LS_COLORS:'or=01;05;31'    # Orphaned link     = Bold, Red, Flashing
LS_COLORS=$LS_COLORS:'*.c=1;33'       # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.C=1;33'       # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.h=1;33'       # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.cc=1;33'      # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.awk=1;33'     # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.pl=1;33'      # Sources           = Bold, Yellow
LS_COLORS=$LS_COLORS:'*.jpg=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.jpeg=1;32'    # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.JPG=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.gif=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.png=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.jpeg=1;32'    # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.ppm=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.pgm=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.pbm=1;32'     # Images            = Bold, Green
LS_COLORS=$LS_COLORS:'*.tar=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.tgz=1;31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.gz=1;31'        # Archive           = Red
LS_COLORS=$LS_COLORS:'*.xz=1;31'        # Archive           = Red
LS_COLORS=$LS_COLORS:'*.zip=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.sit=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.lha=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.lzh=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.arj=31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.bz2=1;31'       # Archive           = Red
LS_COLORS=$LS_COLORS:'*.html=36'      # HTML              = Cyan
LS_COLORS=$LS_COLORS:'*.htm=1;34'     # HTML              = Bold, Blue
LS_COLORS=$LS_COLORS:'*.php=1;45'     # PHP               = White, Cyan
LS_COLORS=$LS_COLORS:'*.doc=1;34'     # MS-Word *lol*     = Bold, Blue
LS_COLORS=$LS_COLORS:'*.txt=0'        # Plain/Text        = Default Foreground
LS_COLORS=$LS_COLORS:'*.o=1;36'       # Object-Files      = Bold, Cyan
LS_COLORS=$LS_COLORS:'*.a=1;36'       # Shared-libs       = Bold, Cyan
export LS_COLORS

# colorful man page
#export PAGER="`which less` -s"
#export BROWSER="$PAGER"
#export LESS_TERMCAP_mb=$'\E[38;5;167m'
#export LESS_TERMCAP_md=$'\E[38;5;39m'
#export LESS_TERMCAP_me=$'\E[38;5;231m'
#export LESS_TERMCAP_se=$'\E[38;5;231m'
#export LESS_TERMCAP_so=$'\E[38;5;167m'
#export LESS_TERMCAP_ue=$'\E[38;5;231m'
#export LESS_TERMCAP_us=$'\E[38;5;167m'

DIRSTACKSIZE=99
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # exclude '/' for backward-kill-word

#setopt correctall
setopt append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt no_hist_beep
setopt hist_save_no_dups
setopt noflowcontrol                  #no flow control enable keybind for ^Q
setopt AUTO_PUSHD
setopt PUSHD_MINUS
#setopt menu_complete

autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*' special-dirs true

# hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*})
# zstyle ':completion:*:hosts' hosts $hosts

# git flow
# http://github.com/nvie/git-flow-completion
# source ~/.git-flow-completion.zsh

zle_highlight=(region:bg=magenta special:bold isearch:underline)

#bindkey -v                               # vi mode
bindkey -e                               # emacs mode
bindkey "\e[1~" beginning-of-line        # Home
bindkey "\e[7~" beginning-of-line        # Home rxvt
bindkey "\e[2~" overwrite-mode           # Ins
bindkey "\e[3~" delete-char              # Delete
bindkey "\e[4~" end-of-line              # End
bindkey "\e[8~" end-of-line              # End rxvt
bindkey "\e[5~" history-search-backward  # PageUp
bindkey "\e[6~" history-search-forward   # PageDown
bindkey '^F' forward-word
bindkey '^B' backward-word
bindkey "^Q" push-line
bindkey "^G" get-line
bindkey "^Z" undo
#bindkey "^Y" vi-undo-change
bindkey "^Xc" copy-region-as-kill
bindkey "^Xx" kill-region

bindkey '^[[1;9D' backward-word          # Alt+Left
bindkey '^[[1;9C' forward-word           # Alt+Right

expand-to-home-or-insert () {
  if [ "$LBUFFER" = "" -o "$LBUFFER[-1]" = " " ]; then
    LBUFFER+="~/"
  else
    zle self-insert
  fi
}
zle -N expand-to-home-or-insert
# bindkey "\\"  expand-to-home-or-insert

os=`uname`

alias vi="vim"
alias vim="vim -p"
alias df="df -h"
if [ $os = "Darwin" ]; then
    alias ls="ls -G"
else
    alias ls="ls --color"
fi
alias ll="ls -al"
alias l="ls -a"
alias cls="clear"
alias clc="clear"
alias g='grep'
alias :q='exit'
alias :Q='exit'
alias vf="cd"
alias ~="cd ~"
alias ..="cd .."
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

alias ci='git commit'
alias co='git checkout'
alias clone='git clone'
alias merge='git merge'
alias commit='git commit'
alias checkout='git checkout'

#autojump for osx
if [ "`command -v brew`" != "" ]; then
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    [[ -s `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh
fi
#autojump for linux
[[ -s /etc/profile.d/autojump.sh ]] && . /etc/profile.d/autojump.sh

[[ -s ~/.zdhrc.local ]] && source ~/.zdhrc.local

function check_compression {
    local unzipped=`curl "$1" --silent --write-out "%{size_download}"  --output /dev/null`
    local zipped=`curl -H "Accept-Encoding: gzip,deflate" "$1" --silent --write-out "%{size_download}" --output /dev/null`
    echo "unzipped size: $unzipped, zipped size: $zipped"
}

if [[ -s ~/.rvm/scripts/rvm ]]; then
    source ~/.rvm/scripts/rvm
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

[[ -s ~/.oh-my-zsh/plugins/jira/jira.plugin.zsh ]] && source ~/.oh-my-zsh/plugins/jira/jira.plugin.zsh

export NVM_DIR="/Users/othree/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source /Users/othree/.iterm2_shell_integration.zsh

export GOPATH=$HOME/.go/
export PATH=$GOPATH/bin:$PATH

export PATH=~/bin:$PATH
