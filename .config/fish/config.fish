#start x at login.
if status --is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" -eq "1"
    exec startx -- -keeptty
  end
end

#nvm use 6
#start tmux at boot of fish shell
#test $TERM != "screen"; and exec tmux
# if status --is-interactive
#     if test -z (echo $TMUX)
#         if not test (tmux attach)
#             tmux new-session
#         end
#     end
# end

# EXPORT ###

# Language Default
set -x LC_ALL ""
set -x LC_CTYPE en_US.UTF-8

# add homebrew to the beginning of PATH
set -x PATH "/usr/local/bin" $PATH
set -x PATH "/usr/local/sbin" $PATH
# set -x PATH "$HOME/bin" $PATH

# ruby
# setup rbenv (from https://gist.github.com/2937920)
# # to make Ruby faster http://tmm1.net/ruby21-rgengc/?utm_source=rubyweekly&utm_medium=email
# set -x  RUBY_GC_HEAP_INIT_SLOTS 600000
# set -x  RUBY_GC_HEAP_FREE_SLOTS 600000
# set -x  RUBY_GC_HEAP_GROWTH_FACTOR 1.25
# set -x  RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

# nodejs
# set -x NODE_PATH "$HOME/.npm/lib/node_modules" $NODE_PATH
# set -x PATH "$HOME/.npm/bin" $PATH
# set -x PATH "./node_modules/.bin" $PATH

# python
# Config `pip' to bail outside a virtualenv by default, see function gpip
# set -x PIP_REQUIRE_VIRTUALENV 1
# Disable `virtualenv' activate script to override prompt
# set -x VIRTUAL_ENV_DISABLE_PROMPT 1
# set -x PYTHONPATH "$HOME/.virtualenvs/myvirtualenv/venv/lib/python3.5/site-packages"

# pyenv
# set -x PYENV_ROOT "$HOME/.pyenv"
# set -x PATH "$PYENV_ROOT/bin" $PATH

# conda
# set -x PATH "$HOME/anaconda3/bin" $PATH
# source (conda info --root)/etc/fish/conf.d/conda.fish
# activate py27
# set -x MKL_THREADING_LAYER GNU

# pyenv rehash
# . (pyenv init - | psub)
# . (pyenv virtualenv-init - | psub)
#
# pyenv activate conda-ml

# go
# set -x GOPATH "$HOME/.go-lib"
# set -x PATH "$GOPATH/bin" $PATH
# set -x PATH "/usr/local/opt/go/libexec/bin" $PATH
#
# # haskell
# set -x PATH "$HOME/.cabal/BIn" $PATH

# respect local bins

# ionic
# set -x JAVA_HOME "/Library/Java/HOME"
# set -x PATH "$JAVA_HOME/bin" $PATH
# 
# set -x GRADLE_HOME "/usr/local/opt/gradle"
# 
# set -x ANDROID_HOME  "/usr/local/share/android-sdk"
# set -x PATH "$ANDROID_HOME/tools" $PATH
# set -x PATH "$ANDROID_HOME/platform-tools" $PATH

# editor
set -x EDITOR "vim"

# LESS with colors
# from http://blog.0x1fff.com/2009/11/linux-tip-color-enabled-pager-less.html
set -x LESS "-RSM~gIsw"

# Colorful man pages
# from http://pastie.org/pastes/206041/text
setenv -x LESS_TERMCAP_mb (set_color -o red)
setenv -x LESS_TERMCAP_md (set_color -o red)
setenv -x LESS_TERMCAP_me (set_color normal)
setenv -x LESS_TERMCAP_se (set_color normal)
setenv -x LESS_TERMCAP_so (set_color -b blue -o yellow)
setenv -x LESS_TERMCAP_ue (set_color normal)
setenv -x LESS_TERMCAP_us (set_color -o green)


# grep colors
# setenv -x GREP_OPTIONS "--color=auto"

# alias
alias ..="cd .."
alias ...="cd ../.."
# alias -="cd -"

alias la="ls -lah"

# List only directories
alias lsd='ls -l | grep "^d"'

alias ll='ls -ahlF'
alias l='ls -CF'

################################
###  File ShortCut
################################
alias D="cd ~/Downloads"
alias d="cd ~/Dropbox"
alias p="cd ~/project"
alias g="git"
alias gp="git push origin master"
alias gs="git status"
alias v="vagrant"
alias e="exit"

################################
###  Xi's own customization
################################
alias ibuild="ionic cordova build android --prod --release"
alias ipush="ionic cordova run android"
alias is="ionic serve"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias jen="ssh finxxi@40.85.132.47"

alias pac="sudo pacman"
alias pacs="sudo pacman -S"

alias repos="cd ~/repos"
alias opi="cd ~/repos/opisuomea.com"
alias co="cd ~/repos/codetimecn.com"
alias to="cd ~/repos/tools"
alias tray="xrandr --output Virtual1 --primary --left-of Virtual2"
alias ic="ionic cordova"
alias dub="cd ~/project/dublearn"
alias up="cd ~/project/uploadvideo"

set fish_color_normal dedede
set fish_color_command 7aa6da
set fish_color_quote e78c45
set fish_color_redirection c397d8
set fish_color_end c397d8
set fish_color_error d54e53
set fish_color_param ffffff
set fish_color_comment 999999
set fish_color_match 70c0b1
set fish_color_search_match c397d8
set fish_color_operator 70c0b1
set fish_color_escape 70c0b1
set fish_color_cwd b9ca4a

# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1

xmodmap /home/finxxi/.Xmodmap

function fzf-cdhist-widget -d 'cd to one of the previously visited locations'
	# Clear non-existent folders from cdhist.
	set -l buf
	for i in (seq 1 (count $dirprev))
		set -l dir $dirprev[$i]
		if test -d $dir
			set buf $buf $dir
		end
	end
	set dirprev $buf
	string join \n $dirprev | tac | sed 1d | eval (__fzfcmd) +m --tiebreak=index --toggle-sort=ctrl-r $FZF_CDHIST_OPTS | read -l result
	[ "$result" ]; and cd $result
	commandline -f repaint
end
