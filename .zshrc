# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ian"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(coffeescript git rake heroku python node scala history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
alias gd="git diff"
alias gs="git status"
alias gl="git log"
alias gc="git commit"
alias gco="git checkout"
alias gf="git fetch"
alias grm="git fetch; git rebase origin/master"
alias gp="git push"
alias gpr="git pull --rebase"
alias gpp="gpr; gp"
alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)' --decorate --graph"
alias killr="kill -9 `ps ux | grep -v grep | grep rails | awk '{print $2}'`"

export EDITOR='subl -w'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Work
export ANDROID_HOME=/usr/local/android-sdk-macosx
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home
export PLAY_HOME=/usr/local/play-2.1.1
export PATH=$PLAY_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$JAVA_HOME/bin:$PATH
if [ -f ~/.rvm/scripts/rvm ]
then
    . ~/.rvm/scripts/rvm
fi

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }