# Path to your oh-my-zsh installation.
export ZSH=/home/tom/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nicoulaj"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(ag archlinux git yaourt rbenv)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source /etc/profile.d/vte.sh
setopt auto_name_dirs

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=vim
export VISUAL=vim

alias open=xdg-open
alias vim=nvim

function today() {
  date +"%Y-%m-%d"
}

function stuga-protocol() {
  vim $(boil stuga $(date +"%Y-%m-%d").md -b date $(date +"%d.%m.%Y"))
}

function onoc-protocol() {
  vim $(boil onoc $(date +"%Y-%m-%d").md -b date $(date +"%d.%m.%Y"))
}

### Completions ###
fpath=(~/.zsh-completions $fpath)
autoload -U compinit
compinit
### ----------- ###

### SUTURO ###
export EUROC_BASE=~/Development/ROS/suturo
export EUROC_DOCKER_RUN_OPTS="-v /tmp/.X11-unix/X1:/tmp/.X11-unix/X1 -v $EUROC_BASE/bagfiles:/home/suturo/bagfiles -p 27018:27017"

alias dockuro=$EUROC_BASE/euroc_launch/docker/dockuro
alias suturo="cd $EUROC_BASE"
### ------ ###

### DFKI ###
function _rock() {
  if [ -z "$ROCKING" ]; then
    export BEFORE_ROCKING=`pwd`
    export ROCKING=true
    export ROCK_HOME=$HOME/Development/rock
    source  $ROCK_HOME/env.sh

    alias rcb=rock-create-bundle
    alias rcl=rock-create-lib
    alias rco=rock-create-orogen
    alias rcr=rock-create-rubylib
    alias rcv=rock-create-vizkit-widget
  fi
  cd "$ROCK_HOME"
}

function _unrock() {
  cd "$BEFORE_ROCKING"
  unset BEFORE_ROCKING
  unset ROCKING
  unset ROCK_HOME
  exec zsh
}

alias unrock=_unrock
alias rock=_rock
export GITHUB_ACCESS_TOKEN=7a717642c5d385641aa465dfaef8e8681f15dcdd
### ---- ###
