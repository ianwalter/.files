# Tell ls to use colored output.
alias ls='ls --color=auto'

# Use the typewritten prompt: https://github.com/reobin/typewritten
fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# Use zsh-completions: https://github.com/zsh-users/zsh-completions
fpath+=$HOME/.zsh/zsh-completions/src

# Use zsh-suggestions: https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use zsh-syntax-highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add NPM default bin directory to $PATH if created during installation.
PATH=~/.npm-global/bin:$PATH
