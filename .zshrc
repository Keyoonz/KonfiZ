ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh -c ~/.config/oh-my-posh/config.omp.json init zsh)"
fi

#plugins
zinit load laggardkernel/zsh-thefuck
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit load zsh-users/zsh-completions
autoload compinit;
compinit .

#Autosuggestions 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d6bbfb"
ZSH_ATOSUGGEST_STRATEGY=(history completion)

#highlighting 
# TODO

#history options 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

#Completions options

alias vim=nvim
alias ls="ls --color"
alias newmux="tmux new -s"
alias attmux="tmux attach -d -t"
alias glog='git log --pretty=format:"%C(yellow)%h%C(bold blue)%x09%an%x09%C(reset)%s%C(green)%x09%ad" --graph'

eval $(thefuck --alias)

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

eval "$(zoxide init --cmd cd zsh)"


#Keybindgs
bindkey "^F" fuck-command-line
bindkey -r '^[^['
bindkey "^ " autosuggest-accept
bindkey "^E" autosuggest-execute

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

source /home/maeb/.config/broot/launcher/bash/br
