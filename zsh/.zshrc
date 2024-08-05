# ------------------------------
# My configuration
# ------------------------------

source ~/.config/zsh/.env.zsh # load private env variables, example: password, tokens, etc
source ~/.config/zsh/env.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/vi.zsh
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/mappings.zsh
source ~/.config/zsh/prompt.zsh

# ------------------------------
# end
# ------------------------------


zstyle ':zim:zmodule' use 'degit'
ZIM_HOME=~/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# GNU/Linux操作系统
if [[ "$(uname -s | cut -c 1-5)" == "Linux" ]]; then
. "$HOME/.atuin/bin/env"
fi
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
