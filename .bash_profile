# So that programs like git will use vim as the editor instead of vi
export VISUAL=vim
export EDITOR="$VISUAL"

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin:/usr/local/opt/elixir/bin

export PGDATA=/usr/local/var/postgres
export DB_USER=ian
export DB_PASS=""
export DB_HOST=localhost

# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Show all autocomplete results at once
set page-completions off

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
