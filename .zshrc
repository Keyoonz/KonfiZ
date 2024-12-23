ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh -c ~/.config/oh-my-posh/config.omp.json init zsh)"
fi

alias vim=nvim

. /opt/asdf-vm/asdf.sh

eval "$(zoxide init --cmd cd zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
