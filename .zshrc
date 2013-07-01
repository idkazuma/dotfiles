
stty intr 

# path

# rbenv
if [ -d ${HOME}/.rbenv  ] ; then
    # shims は tmux のため
    export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
    eval "$(rbenv init - zsh)"
fi
# plenv
if [ -d ${HOME}/.plenv  ] ; then
    export PATH=${HOME}/.plenv/bin/:${HOME}/.plenv/shims:${PATH}
    eval "$(plenv init - zsh)"
fi

# unset PS1
PS1=%F{5}%#%f
# PS1=%F{7}%K{6}%#%k%f
# PS1=%F{7}%K{6}%/%#%k%f
# RPROMPT=%F{7}%K{6}%T%k%f
RPROMPT=%F{5}%T%f
export MYSQL_PS1="(\u@\h) [\d]>"
# %M  ホスト名    localhost.localdomain
# %m  ホスト名    localhost
# %n  ユーザ名    root
# %#  ユーザ種別  #（rootの場合）
# %（root以外）
# %y  ログイン端末名  pts/0
# %l  ログイン端末名  pst/0（tty*の場合はttyを省略）
# %?  直前のコマンドの戻り値  0
# %h
# %!  コマンド実行数 （history数）   1
# %d
# %/  カレントディレクトリ    /root/currentdir
# %~  カレントディレクトリ    ~/currentdir
# %C  カレントディレクトリ    currentdir
# %c
# %.  カレントディレクトリ    currentdir （$PWD=$HOMEの場合は~）
# %D  日付    12-07-31 書式）yy-mm-dd
# %W  日付    07/31/12 書式）mm/dd/yy
# %w  日付    Sun 31 書式）day dd
# %*  時間    15:50:30 書式）hh:mm:ss
# %T  時間    15:50 書式）hh:mm
# %t
# %@  時間    03:50PM 書式）hh:mm(am/pm format)

# %B  ボールド(%bで終了)
# %E  終了でのクリア
# %U  アンダーライン(%uで終了)
# %S  強調(%sで終了)
# %F  文字の色(%fで終了)
# %K  文字背景の色(%kで終了)
# 0:black、1:red、2:green、3:yellow、4:blue、5:magenta、6:cyan、7:white

# 実行後に右プロンプトを削除する
setopt transient_rprompt
# プロンプト中の変数を展開する
setopt prompt_subst

# emacs
bindkey -e
export LANG=ja_JP.UTF-8
export EDITOR=vim
# export EDITOR=emacs

# 補完
autoload -U compinit
compinit -u
# case insensitive に補完 大文字を入力した場合は区別する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ディレクトリ名だけで cd
# setopt auto_cd
# 重複は記憶しない
setopt pushd_ignore_dups

# cd -[Tab]で移動履歴
setopt auto_pushd
# typoにやさしい
setopt correct

# 補完一覧ファイル種別表示
setopt list_types

# setopt nolistbeep
# setopt no_beep

# history
HISTFILE=~/.zsh_history
# メモリ内の履歴の数
HISTSIZE=100000
# saveする量
SAVEHIST=1000000
# 重複を記録しない
setopt hist_ignore_dups
setopt hist_ignore_space
# setopt hist_reduce_blanks
# 履歴ファイルを共有
setopt share_history
# 実行時刻と実行時間も保存する
setopt extended_history

# 3秒以上かかったら報告
REPORTTIME=3

# 補完候補をつめて表示する
setopt list_packed


# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
case ${OSTYPE} in
  darwin*)
    # change the color of directory to light blue.
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -FG'
    alias mvim='open -a MacVim'
    ;;
  linux*)
    # LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
    # export LS_COLORS
    # export LS_COLORS="di=01;34"
    export LS_COLORS="di=35;40"
    alias ls='ls -F --color'
    ;;
esac

alias ..='cd ..'
alias la='ls -al'
alias lr='ls -altrh'
alias mv='mv -i'
alias :q=exit
alias p=popd
alias bi='bundle install'
alias be='bundle exec'
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias g='git'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git checkout'


# zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'


# RVM
# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# 個別設定を読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

