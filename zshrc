# Set up the prompt

autoload -Uz compinit promptinit
compinit
promptinit
prompt clint

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

source ~/.prompt.sh 

alias algo5='ssh arghas@192.168.0.27'
alias algo6='ssh arghas@192.168.0.29'
alias mk='make -j4'

export CPLUS_INCLUDE_PATH='/home/arghas/local/include'
export LIBRARY_PATH='/home/arghas/local/lib/'
export EDITOR="vim"
export LD_LIBRARY_PATH=/opt/gcc/4.8.3/lib64:$LD_LIBRARY_PATH

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
bindkey "^R" history-incremental-search-backward

path=('/home/arghas/local/bin' '/opt/gcc/4.8.3/bin' $path)
