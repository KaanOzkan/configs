# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/opt/postgresql@11/bin:$PATH
export PATH=/usr/local/bin:$HOME/bin:$PATH:$HOME/.cargo/bin:
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.pyenv/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# fzf
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="kaan"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# USE PURE
fpath+=~/.zsh/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

# User configuration
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey '`' autosuggest-accept

# export MANPATH="/usr/local/man:$MANPATH"
#export PATH = /opt/local/bin
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function chpwd() {
    emulate -L zsh
    ls
}

alias stat="stat -x"
alias v="vim"
alias vi="vim"
# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
alias vim="nvim"
alias mvim="vim"
alias gst="git st"
alias ga="git add -p"
alias c="cargo"
alias cr="cargo run"
alias cb="cargo build"
alias b="bundle"
alias be="bundle exec"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYTHON_CONFIGURE_OPTS="--enable-framework"
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
export GOPATH=$HOME
export CPPFLAGS="-I/usr/local/opt/ruby/include -Wno-nullability-completeness"

source /opt/dev/sh/chruby/chruby.sh
chruby 3.1.2

# Has to be the last line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/kaanozkan/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/kaanozkan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/kaanozkan/.kube/config:/Users/kaanozkan/.kube/config.shopify.cloudplatform
for file in /Users/kaanozkan/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done
kubectl-short-aliases

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
