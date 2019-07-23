# Path to your oh-my-zsh installation.
#export ZSH=

# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="j"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git)

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/share/java/gradle/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/share/scala/bin"
# export MANPATH="/usr/local/man:$MANPATH"

#source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code/src
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export VISUAL=$EDITOR
# source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=~/go

PATH=$PATH:~/code/src/bin/:/Users/jt/Library/Python/2.7/bin
if [[ -z $TMUX ]] && [[ $TERMINAL_EMULATOR != "JetBrains-JediTerm" ]]; then
    tmux
fi
alias vim='/usr/local/bin/vim'
eval "$(pyenv init -)"
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"


# Add to your Bash config file
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
# add ssh keys for easy access
#ssh-add ~/.ssh/gitlab_niksula

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
## Personal aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rr=ranger
#alias ls='ls --color=auto'
alias db=dropbox-cli 

# when calendar preference
alias when='when c'

# tmux shortcuts
alias tmux='tmux -2'
alias tma='tmux a -t '

# tunnel carpal syndrome alias for c++
alias mmain='g++ -Wall -Wextra -pedantic -std=c++0x *.hpp *.cpp -o main'

# Quick calendar look ups
alias calv='vim -c Cal'

# git ssh keys
alias abbssh='ssh-add ~/.ssh/bitbucket'

# motd
#~/.motd.sh

# aws completion
#source $( which aws_zsh_completer.sh )

# zsh cheat sheet
alias refcard='zathura ~/docs/refcard.pdf'

# virtualenv
alias va='source venv/bin/activate'

# mac lsregister to clean up launch services database
# https://eclecticlight.co/2017/08/11/launch-services-database-problems-correcting-and-rebuilding/
alias lsr='sudo /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister'
alias pvr='pipenv run'
alias pvrp='pipenv run python'
alias pvrm='pipenv run python -m'
cpu_usage() (
    ps -e -o %cpu | awk '{s+=$1} END {print s}'
)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

say () {
    pushd /Users/${USER}/code/src/py/pronounce &&\
    pvrm say $@;
    popd
}

alias ackpl='ack --type=cpp --pager=less'
ackp () {
    ack --type=cpp --group $@ | grep -v '\/\*' - |  bat -l cpp --theme TwoDark
}

ackpy () {
    ack --type=python --group $@ | grep -v '#.*' - |  grep -v '.*""".*' - | bat -l py --theme TwoDark
}

words () {
	grep --color=auto -o --extended-regexp '[A-Z]?[a-z]{2,64}' "$@" | tr '[A-Z]' '[a-z]' | sort | uniq -c | sort -r
}
mcw () {
	words "${@:2}" | awk '{printf $2"\n"}' | head -n $1
}
pipe_words () {
	grep --color=auto -o --extended-regexp '[a-zA-Z]+' - | sort | uniq -c | sort -r
}
pipe_mcw () {
	pipe_words | awk '{printf $2"\n"}' | head -n 4
}
svim () {
    # docker server test
    server_response="$( docker ps 2>&1 1>/dev/null )"
    if [[ -n "$server_response" ]]; then
        printf "$server_response \n"
        return
    fi

    if [[ $# > 1 ]]; then
        docker run -it -v ~/.SpaceVim.d:/home/spacevim/.SpaceVim.d -v "$PWD":/home/spacevim/local spacevim/spacevim nvim /home/spacevim/local/"$@"
    else
        docker run -it -v ~/.SpaceVim.d:/home/spacevim/.SpaceVim.d -v "$PWD":/home/spacevim/local spacevim/spacevim nvim
    fi
}
tail_log () {
	tail -f $@ | egrep '(\w+(<[^>]+>)?)+::[^~]+)|$' --color=always
}

iman () {
    arg=${1?"Usage: $0 <command>"}
    pushd ~/code/src/py/igrepper        &&\
    pvr igrepper -c 3 <( man $@ )       &&\
    popd
}

docker-gc () {
    #https://github.com/spotify/docker-gc
    docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
}
