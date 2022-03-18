# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="ian"

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
plugins=(vi-mode git node history-substring-search)

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/.yarn:$PATH

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
alias gb="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"
alias gd="git diff"
alias gs="git status"
alias gc="git commit -v"
alias gca="gc -a"
alias gco="git checkout"
alias gf="git fetch"
alias grm="git fetch origin master; git rebase origin/master"
alias grim="grm -i"
alias gri="git rebase -i"
alias gp="git push"
alias gpf="git push --force-with-lease --no-verify"
alias gpr="git rev-parse --abbrev-ref HEAD | xargs git pull --rebase origin"
alias gpuh="git push -u origin head"
alias gdh="git rev-parse --abbrev-ref HEAD | xargs git push origin --delete"
alias gap="git add -p"
alias gad="git add ."
alias gl="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)' --decorate --graph"
alias fux="yarn lint:fix"

# pure
fpath+=('/Users/imcnally/.nvm/versions/node/v12.12.0/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='
  --color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
  --color info:254,prompt:37,spinner:108,pointer:235,marker:235
'

export EDITOR=/usr/bin/vim

# work
# source ~/.bash_profile

export OSCAR_PROFILE_PATH=~/.oscar_exports
# source $OSCAR_PROFILE_PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"
