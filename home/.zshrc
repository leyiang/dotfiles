export ZSH="$HOME/.oh-my-zsh"
export WORK_FOLDER="~/Work";
export DOT_FOLDER="${WORK_FOLDER}/dotfiles";
export CODE_FOLDER="${WORK_FOLDER}/code/";
export NVIM_PLUGIN_FOLDER="~/.local/share/nvim/site/pack/packer";
export XM3_MAC="94:DB:56:85:7C:BD"
export PYTHONSTARTUP=~/.python_startup.py

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
)

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh
source ~/.zshrc_third_party
source ~/.zshrc_extra
source ~/.zsh_cd_alias
source ~/.cargo/env
source ~/.zsh_cmp
source ~/my_bash_lib
# eval "$(fzf --zsh)"

function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Use vi motion in zsh
bindkey -v

if [ -n "$TMUX" ]; then
    export TERM="tmux-256color"
fi


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

# . "/home/yiang/.deno/env"




#### ctrl+t 复制shell当前行
copy-current-line-to-clipboard-if-not-empty() {
	zle reset-prompt
    local current_line="$BUFFER"
    
    # 检查当前行是否非空
    if [[ -n "$current_line" ]]; then
        # 将当前行内容传递给剪贴板工具 (Linux)
        echo -n "$current_line" | xclip -selection clipboard

		# print -P "%F{green}Copied to clipboard!%f"
		zle send-break  # 模拟中断命令的效果(ctrl+c)
    else
        # 如果是空行，则不执行任何操作
    fi
    
    # 不清空行缓冲区
    # zle kill-whole-line  # 清空行缓冲区以避免显示混乱
}

zle -N copy-current-line-to-clipboard-if-not-empty
bindkey '^t' copy-current-line-to-clipboard-if-not-empty  # ctrl+t 组合键
bindkey -M viins '^t' copy-current-line-to-clipboard-if-not-empty  # ctrl+t 组合键
bindkey -M vicmd '^t' copy-current-line-to-clipboard-if-not-empty  # ctrl+t 组合键
#### ctrl+t 复制shell当前行






#### cd 文件进入所在目录
function cdfile() {
	if [ $# -eq 0 ]; then
		# 如果没有提供参数，行为与普通cd相同
		cd
	elif [ -f "$1" ]; then
		# 如果参数是一个文件，cd到文件所在的目录
		cd -- "$(dirname -- "$1")"
	else
		# 否则尝试将参数作为目录进行cd
		cd -- "$1"
	fi
}
alias cd='cdfile'
#### cd 文件进入所在目录





try_notify() {
    local exit_status=$?

    if [ $exit_status -eq 0 ]; then
        notify-send "Command Completed" "The command completed successfully."
    else
        notify-send "Command Failed" "There was an error while running the command. Exit code: $exit_status"
    fi
}

bindkey '\el' autosuggest-accept      # Alt  + l => apply suggestion
bindkey '\ek' history-search-backward # Alt  + k => 上箭头 (历史命令)
bindkey '\ej' history-search-forward  # Alt  + j => 下箭头 (历史命令)
bindkey '^A'  beginning-of-line       # Ctrl + a => 把指针移到最前

alias tt="tmux attach-session -t"
alias tk="tmux kill-session -t"
alias tks="tmux kill-server"
alias suspend="systemctl suspend"

run_backend() {
	tmux new-session -d -s "$1" "$2"
}

# tmux 快捷键
# t                => 列出tmux session
# t Command        => 运行Command, Session名自动生成
# t Name Command   => tmux 运行Command
t() {
    if [[ $# -gt 1 ]]; then
        run_backend "$1" "$2"
    elif [[ $# -eq 1 ]]; then
        local sanitized_param=$(echo "$1" | sed 's/[ -]/_/g')
        run_backend "$sanitized_param" "$1"
    else
        tmux ls | column -t -o '  '
    fi
}
