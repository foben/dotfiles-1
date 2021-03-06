# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/bschaefer/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

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
plugins=(osx vundle git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# install vundle if non-existing
vundle-init

# export MANPATH="/usr/local/man:$MANPATH"

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

# bash-like ctrl-u behavior
bindkey "^u" backward-kill-line

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

export MAVEN_HOME=/Users/bschaefer/Documents/projekte/rewe/development-toolkit/maven-3.1.1
export PATH=$MAVEN_HOME/bin:$PATH

# --- VIM ---
export EDITOR=$(which vim)

# --- Java ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# --- Eclipse ---
ECLIPSE_HOME=/opt/eclipse/eclipse-default
if [ -d $ECLIPSE_HOME ]; then
    export PATH=$PATH:$ECLIPSE_HOME
fi

# --- Spark ---
export SPARK_LOCAL_IP=127.0.0.1
if [ -d /opt/spark/spark-default ]; then
    export SPARK_HOME=/opt/spark/spark-default
    export PATH=$PATH:$SPARK_HOME/bin
fi

# for using RDD and lambda operations this python version needs to be in $PATH on all cluster nodes
export PYSPARK_PYTHON="python3.6"
export PYSPARK_DRIVER_PYTHON="jupyter"
#export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --ip='*' --port=8888"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

# Anaconda 3
if [ -d /opt/anaconda/anaconda3/bin ]; then
    export PATH=/opt/anaconda/anaconda3/bin:$PATH
fi
if [ -d /usr/local/anaconda3/bin ]; then
    export PATH=/usr/local/anaconda3/bin:"$PATH"
fi

# unix
export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude=.Rhistory --exclude-dir=.git --exclude-dir=.Rproj.user'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
