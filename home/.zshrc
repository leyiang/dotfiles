export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

DISABLE_AUTO_UPDATE="true"

source ~/.zshrc_third_party
source ~/.zshrc_extra
source $ZSH/oh-my-zsh.sh

export WORK_FOLDER="~/Work";
export DOT_FOLDER="${WORK_FOLDER}/dotfiles";
export CODE_FOLDER="${WORK_FOLDER}/code/";
export NVIM_PLUGIN_FOLDER="~/.local/share/nvim/site/pack/packer";

export XM3_MAC="94:DB:56:85:7C:BD"

# Custom Alias
alias .nvim="cd ~/.config/nvim";
alias .git="cd ${DOT_FOLDER}/git";
alias .zsh="cd ${DOT_FOLDER}/zsh";
alias .lt="cd ${CODE_FOLDER}/leetcode";
alias .plugin="cd ${NVIM_PLUGIN_FOLDER}"
alias .dot="cd ${DOT_FOLDER}";
alias .w="cd ${WORK_FOLDER}";
alias .todo="cd ${WORK_FOLDER}/todo";
alias .blog="cd ${WORK_FOLDER}/leyiang.github.io/"
alias .sokoban="cd ${WORK_FOLDER}/sokoban"
alias .notes="cd ${WORK_FOLDER}/notes"
alias .ai="cd ${WORK_FOLDER}/ai"
alias .flash="cd ${WORK_FOLDER}/flashcard"
alias .chrome="cd ${WORK_FOLDER}/chrome/chromium/src/out/Default"
alias .dwm="cd ~/source/dwm"
alias .doc="cd ${WORK_FOLDER}/doc"
alias .ctf="cd ${WORK_FOLDER}/ctf"
alias .test="cd ${WORK_FOLDER}/test"
alias .t="cd ${WORK_FOLDER}/test"
alias .a="cd ${WORK_FOLDER}/algo"
alias .algo="cd ${WORK_FOLDER}/algo"
alias .ap="cd /etc/apache2"
alias .html="cd /var/www/html"
alias .kr="cd /var/lib/minidlna/kr"
alias .ala="cd ~/.config/alacritty"

alias .nand="cd /home/yiang/Work/nand-computer/nand2tetris"

alias .blog="cd ${WORK_FOLDER}/blog"
alias python="python3"
alias pip="pip3"

alias r=". ranger"
alias ra=". ranger"
alias pc="python -c"

alias pt="php artisan test"
alias pdb="php artisan migrate:fresh && php artisan db:seed"

alias sr="systemctl restart"
alias sra="systemctl restart apache2"
alias me='make edit'
alias mt="make test"

# Use vi motion in zsh
bindkey -v
# Set Reverse Search
bindkey '^R' history-incremental-search-backward

alias m="extend-make"
alias mm="nvim Makefile"
alias v="code"
alias mi="make install"

export NEMU_HOME=/home/yiang/Work/system/ics2020/nemu
export AM_HOME=/home/yiang/Work/system/ics2020/abstract-machine
export CUSTOM_MODELS="+gpt-4-all"

if [ -n "$TMUX" ]; then
    export TERM="tmux-256color"
fi

alias rexrandr="xrandr --output DP-1 --off && xrandr --output DP-1 --auto --right-of eDP-1"

export PYTHONSTARTUP=~/.python_startup.py

alias ag="sgpt"
alias copy="tr -d '\n' | xclip -selection clipboard"

# Define the completion function
_nvimf() {
    # List all scripts in ~/.local/bin/ to complete the script name
    reply=(~/.local/bin/*(:t))
}

# Call the completion function when completing "nvimf"
compctl -K _nvimf nvimf
alias l="ls -lSh"


# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=raw-history-view,hicolor       # get more colors
hstr_no_tiocsti() {
    zle -I
    { HSTR_OUT="$( { </dev/tty hstr ${BUFFER}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    BUFFER="${HSTR_OUT}"
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N hstr_no_tiocsti
bindkey '\C-r' hstr_no_tiocsti
export HSTR_TIOCSTI=n

alias lg="lazygit"
