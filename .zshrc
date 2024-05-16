# PLUGINS ---------------------------------------------------------------------

source ~/.zgen/zgen.sh
if ! zgen saved; then
    zgen load zpm-zsh/colors
    zgen save

# PROMPT ----------------------------------------------------------------------

setopt prompt_subst
function precmd {
    PREPROMPT="$c[bold]$c[blue]%n $c[violet][$(git rev-parse --abbrev-ref HEAD 2> /dev/null)] $c[orange]%~ $c[green]\$ $c[base2]"

}
PROMPT='$PREPROMPT'

# ENVIRONMENT VARIABLES -------------------------------------------------------

export NVIM_DIR=/usr/local/share/nvim-linux64
export PATH=$NVIM_DIR/bin:$PATH

# ALIASES ---------------------------------------------------------------------

alias cls=clear
alias ezsh='nvim ~/.zshrc'
alias lzsh='source ~/.zshrc'
alias gs='git status'
alias gl='git log --oneline'
alias gp='git pull origin $1'
alias gco='git checkout $1'
alias f="fzf --border --height 40% --bind 'enter:become(nvim {})'"