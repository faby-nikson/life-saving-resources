# Sourced from ~/.zshrc by setup/configure.sh
#
# Resolve the repo root from this file's own location, so the repo can live anywhere:
# <root>/setup/config/zsh/aliases.zsh -> four levels up
export LSR_ROOT="${${(%):-%x}:A:h:h:h:h}"

# --- PATH ---
typeset -U path
path=("$LSR_ROOT/bin" $path)

# --- Global ---
alias ws="cd ~/Workspace/ && l"
alias li='cd "$LSR_ROOT"'

# --- Tools (in $LSR_ROOT/bin, see the repo README) ---
alias _l='lsr-link'
alias _gitchecker='git-checker ~/Workspace/'
alias _gitcleaner='git-clean'
