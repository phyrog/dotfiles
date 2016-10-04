if [[ "$TERM" == "xterm" ]]; then
  export TERM=xterm-256color
fi

# Path to your oh-my-zsh installation.
export ZSH=/home/tom/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nicoulaj"
# zsh 5.2 has a bug with this theme. to fix it, delete the line
# ```
# local -a msgs
# ```
# in the file /usr/share/zsh/functions/VCS_Info/VCS_INFO_nvcsformats

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
plugins=(ag archlinux git yaourt rbenv bundler)

# User configuration

export PATH="$HOME/.rbenv/shims:$HOME/.cabal/bin:/usr/bin/core_perl:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/.local/bin"
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

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!tmp/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export EDITOR=nvim
export VISUAL=nvim

alias open=xdg-open
alias vim=nvim
alias vimdiff='nvim -d'
alias sbcl='with-readline sbcl'
alias temp='cd $(mktemp -d)'

function play() {
  if [ -n "$1" ]; then arg="$1-"; fi
  cd $(mktemp -d -p $HOME/Development/playground "${arg}XXXXXX")
  pwd
}

function today() {
  date +"%Y-%m-%d"
}

function stuga-protocol() {
  vim $(boil stuga $(date +"%Y-%m-%d").md -b date $(date +"%d.%m.%Y"))
}

function onoc-protocol() {
  vim $(boil onoc $(date +"%Y-%m-%d").md -b date $(date +"%d.%m.%Y"))
}

function docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@
}

### Completions ###
fpath=(~/.zsh-completions $fpath)
autoload -U compinit
compinit
### ----------- ###

function start_ontohub() {
  _ systemctl start redis elasticsearch postgresql
}

function stop_ontohub() {
  _ systemctl stop redis elasticsearch postgresql
}

NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$PATH:$NPM_PACKAGES/bin"
# PATH="$NPM_PACKAGES/bin:$PATH"
# export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
