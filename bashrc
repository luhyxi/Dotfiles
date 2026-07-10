#
# ~/.bashrc
#
# Luaninha's best .bashrc
# 
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# -----------------------------------------------------------------------------

# Path settings
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/.dotnet/tools:$PATH
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"

# Default applications
export GOPATH=$HOME/.config/go
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'
export PAGER=less
export GTK_THEME=Adwaita:dark
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export OMNISHARP=$HOME/.local/share/nvim/mason/packages/omnisharp/OmniSharp
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:/usr/share/dotnet:$HOME/.dotnet/tools
export BUN_INSTALL="$HOME/.bun"
export MPD_HOST="$XDG_RUNTIME_DIR/mpd/socket"

# History settings
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups  
export HISTIGNORE="ls:cd:exit:clear:history"

# -----------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# File operations
alias ii='dolphin'

# Development
alias vi='nvim'
alias vw='nvim -c VimwikiIndex'
alias vd='nvim -c VimwikiMakeDiaryNote'
alias z='zoxide'
alias k='kubectl'

# System
alias p='sudo pacman'
alias update='sudo pacman -Syu'
alias meminfo='free -m -l -t'
alias psg='ps aux | grep'

# Clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'

# Database
alias pgs='sudo -u postgres psql'

# WSL Stuff
alias win='cd /mnt/c/Users/4960042776'


# -----------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------

# Yazi file manager with directory tracking
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Extract most known archives
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# -----------------------------------------------------------------------------
# APPEARANCE
# -----------------------------------------------------------------------------

# Define default prompt if Starship isn't available
PS1='[\u@\h \W]\$ '

# Cute aesthetic stuff
if [ -x /usr/bin/cowsay -a -x /usr/bin/fortune ]; then
  fortune | cowsay | lolcat
fi

# Initialize Starship prompt
if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

# -----------------------------------------------------------------------------
# TOOL INITIALIZATION
# -----------------------------------------------------------------------------

# Initialize Deno (fix for incomplete line in original file)
if [ -f "$HOME/.deno/bin/deno" ]; then
  export DENO_INSTALL="$HOME/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# NVM (Node Version Manager) if installed
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# -----------------------------------------------------------------------------
# LOCAL CONFIGURATIONS
# -----------------------------------------------------------------------------

# Source local configurations (if they exist)
if [ -f "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

# zoxide
eval "$(zoxide init bash)"

# bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi
. "/home/luana/.deno/env"

if command -v tmux &> /dev/null && [ -z "$TMUX" ] && 
    [[ "$SSH_CONNECTION" == "" ]]; then
    tmux attach-session -t default || tmux new-session -s default
fi

# Created by `pipx` on 2026-07-07 10:12:09
export PATH="$PATH:/home/luana/.local/bin"
