# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="taw-ys"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
	    	git
	    	extract
	    	jump
	    	sudo
    		eza
		    zsh-syntax-highlighting
	    	zsh-autosuggestions
    	)

source $ZSH/oh-my-zsh.sh

# User configuration

# Editor Settings
export EDITOR='nvim'
alias vim='$EDITOR'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Custom aliases according to $EDITOR
alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload=". ~/.zshrc"

alias vimconfig="$EDITOR ~/.vimrc"
alias nvimconfig="$cd ~/.config/nvim && $EDITOR"
alias bashconfig="$EDITOR ~/.bashrc"
alias srcconfig="sudo $EDITOR /etc/apt/sources.list"
alias kittyconfig="$EDITOR ~/.config/kitty/kitty.conf"

# Abbreviations
# alias apt="sudo apt"
alias pacman="sudo pacman"
# alias bat="batcat"

# Kitty aliases
alias kitty-icat="kitty +kitten icat"
    alias kitty-themes="kitty +kitten themes"

# Custom update functions
function newApps() {
    if command -v apt &> /dev/null; then
        # if system has `apt` command, then run it
        apt clean
        apt update
        apt full-upgrade
    elif command -v yay &> /dev/null; then
        # if system has `yay` command, then run it
        yay -Syu
    else
        echo "This script requires either apt or pacman to be installed."
        return 1
    fi
}

# OpenSSL Settings
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Vivado setup shell scripts
. "/opt/xilinx/Vivado/2024.2/settings64.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /usr/share/nvm/init-nvm.sh
