# Set vim mode keymappings to readline
bindkey -v 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# plugins=(git)

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
export EDITOR=nvim
export VISUAL=$EDITOR
# source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=~/go
export VCPKG_ROOT="$HOME/vcpkg"

PATH=$PATH:~/code/bin
if [[ -z $TMUX ]] && [[ $TERMINAL_EMULATOR != "JetBrains-JediTerm" ]]; then
    tmux
fi

export PATH=$PATH:$HOME/.cargo/bin
# alias vim='/usr/local/bin/vim'
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
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
    pvr igrepper -c 3 <( man $@ )
    popd
}

docker-gc () {
    #https://github.com/spotify/docker-gc
    docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
alias poetry='python3 -m poetry'
alias dephell='python3 -m dephell'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export HOMEBREW_NO_ANALYTICS=1
function nv ()
{
#    local nv_config_path="$HOME/.config/nvim"
#    local nv_basic_config_path="$HOME/.config/nvim-basic"
#    local nv_doom_config_path="$HOME/.config/nvim-doom"
#    if [[ -L "$nv_config_path" ]]; then
#       rm -f "$nv_config_path"
#    fi
#    /bin/ln -s "$nv_basic_config_path" "$nv_config_path"

    if [[ -n "$VIRTUAL_ENV" ]]; then
        virtualenv="$VIRTUAL_ENV"
        deactivate
        nvim $@
        source "$virtualenv"/bin/activate
    else
        nvim $@
    fi

}
# function doom ()
# {
#     local nv_config_path="$HOME/.config/nvim"
#     local nv_basic_config_path="$HOME/.config/nvim-basic"
#     local nv_doom_config_path="$HOME/.config/nvim-doom"
#     if [[ -L "$nv_config_path" ]]; then
#        rm -f "$nv_config_path"
#     fi
#     /bin/ln -s "$nv_doom_config_path" "$nv_config_path"
# 
#     if [[ -n "$VIRTUAL_ENV" ]]; then
#         virtualenv="$VIRTUAL_ENV"
#         deactivate
#         CC=gcc nvim $@
#         source "$virtualenv"/bin/activate
#     else
#         CC=gcc nvim $@
#     fi
# }
#alias nv=nvim
#source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/pipo.bash

# Auto-activate pyenv-virtualenv when navigating to dir
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
ass() { bat --color always -l s <<<$(clang++ -S -Ofast -o /dev/stdout "$1" ) }

vw_sync () {
    echo '== Checking macmini -> local =='
    rsync -havzP --update macmini:vimwiki/ ~/vimwiki/

    echo '== Checking macmini <- local =='
    rsync -havzP --update ~/vimwiki/ macmini:vimwiki/
}
now () {
    #python -c 'from datetime import datetime; print(datetime.now().isoformat().replace(":", "."))' | tee pbcopy
    python -c 'from datetime import datetime; print(datetime.now().isoformat().replace(":", "."))' | tee >&2 | pbcopy <<<2
}

function vactivate () {
    if [[ ! -d .venv ]]; then
        python -m venv .venv
        source .venv/bin/activate
        pip install -U pip
    else
        source .venv/bin/activate
    fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# SDK paths
export VST2_SDK_PATH=$HOME/SDKs/vstsdk2.4 
export VST3_SDK_PATH=$HOME/SDKs/VST_SDK_3.7.1/VST3_SDK 
export AAX_SDK_PATH=$HOME/SDKs/AAX 

function pbclone ()
{
    git clone git@bitbucket.org:pluginbabylon/"$1"
}

function html2pdf ()
{
    # brew install librsvg python homebrew/cask/basictex pandoc
    # restart iterm
    local source="${1?"Usage $0 <source_file (html)> <destination (pdf)>"}"
    local destination="${2?"Usage $0 <source_file (html)> <destination (pdf)>"}"
    pandoc "$source" -t latex -o "$destination" --pdf-engine=/Library/TeX/texbin/xelatex
}

function presentation ()
{
    cd ~/presiis/slides
    open -n -a "Brave Browser" --args --new-window 'http://localhost:8080/'
    marp -s .
    cd -
}

export JUCE_DIR=~/code/plugins/JUCE

# Created by `pipx` on 2023-04-10 09:45:09
export PATH="$PATH:$HOME/.local/bin"

function git-log-submodules ()
{
    git log --graph --oneline -U0 --submodule  | grep -E '^[*| /\\]+([0-9a-f]{7} |Submodule |> |$)' | bat -l gitlog
}

function fix_submodules ()
{
    git submodule sync --recursive
    git submodule update --init --recursive --remote
    git pull --recurse-submodules
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function choose ()
{
    local check=${1?"Usage choose [options...]"}
    local arr=(${@:1})
    echo "${ arr[$(( ($RANDOM % ${#})+1 ))] }"
}


