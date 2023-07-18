setopt nobeep # ビープを鳴らさない
setopt no_tify # バックグラウンドジョブが終了したらすぐに知らせる。

# History
HISTSIZE=10000 # メモリに保存される履歴の件数
SAVEHIST=10000 # 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_all_dups # 重複するコマンドは古い法を削除する
setopt share_history # 異なるウィンドウでコマンドヒストリを共有する
setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks # 余分な空白は詰めて記録

# Alias
alias h="cd ~"
alias e="exit"
alias g='git'
alias v='nvim'
alias t='tmux'
alias l='exa -aal'
alias la='exa -aa'
alias ll='exa -l'
alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache"'
alias lta='exa -T -a -I "node_modules|.git|.cache" --color=always | less -'
alias dco='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias here='explorer.exe .'
alias c='clear'
alias pj='cd ~/pj'
alias atcoder='cd ~/pj/atcoder'
alias k='kubectl'
alias cr='cargo run'
alias bcr='RUST_BACKTRACE=1 cargo run'
alias crb='cargo run --bin'
alias cf='cargo fmt'
alias ct='cargo test -- --nocapture'
alias catt='cargo atcoder test'
alias bcatt='RUST_BACKTRACE=1 cargo atcoder test'
alias cats='cargo atcoder submit'
alias catn='cargo atcoder new'
alias snippet='cargo snippet -t vscode > /mnt/c/Users/dev/AppData/Roaming/Code/User/snippets/rust.json'
alias cm='compiledb make'
alias unity='cd /mnt/c/Users/dev/pj/unity'

# out profile
if (which zprof > /dev/null 2>&1) ;then
    zprof > ~/zproflog
fi

# bat
export BAT_THEME="Monokai Extend"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/dev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end