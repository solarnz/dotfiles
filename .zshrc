# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall

setopt autocd
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del

autoload -U colors
colors

autoload -U promptinit
promptinit

git_prompt() {
     ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
      echo \($ref\)
}


prompt_gentoo_setup () {
    prompt_gentoo_prompt=${1:-'blue'}
    prompt_gentoo_user=${2:-'green'}
    prompt_gentoo_root=${3:-'red'}

    if [ "$USER" = 'root' ]
        then
        base_prompt="%B%F{$prompt_gentoo_root}%m%k "
        else
            base_prompt="%B%F{$prompt_gentoo_user}%n@%m%k "
            fi
            post_prompt="%b%f%k"

#setopt noxtrace localoptions

setopt promptsubst

path_prompt="%B%F{$prompt_gentoo_prompt}%2~"
PS1="$base_prompt$path_prompt %(1j.(%j).)%# $post_prompt"
PS2="$base_prompt$path_prompt %_> $post_prompt"
PS3="$base_prompt$path_prompt ?# $post_prompt"
}

function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo \(${ref#refs/heads/}\)
}

prompt_gentoo_setup "$@"
setopt promptsubst
export RPROMPT=$'%{$fg[green]%}%B$(git_current_branch)%b%{$reset_color%}'

if [[ -x /usr/local/bin/gls ]]; then
    alias ls="gls --color=auto"
else
    alias ls="ls --color"
fi

if [[ $(uname) == "Darwin" ]]; then
    PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/share/python/:/usr/local/share/npm/bin/:$PATH"
    alias find="gfind"
    alias tar="gtar"
fi

if [[ $(uname) == "Linux" ]]; then
    export PATH=$PATH:~/bin:~/android-dev/android-sdk-linux_x86/platform-tools:~/android-dev/android-sdk-linux_x86/tools:/usr/share/java/apache-ant/bin:/usr/local/sbin
    export PATH="$PATH:/home/chris/.local/bin:/opt/vagrant/bin:/home/chris/arc/arcanist/bin:/home/chris/local/bin"
    export TERM=xterm-256color
fi


## work section ##

alias gcd='cd ~/dev/gaf/www/content/gaf-cvs/'
alias menv="cd ~/dev/messaging; source thr_env/bin/activate;"
alias gf="fg"
alias ll="ls -la"
alias l="ls -l"
alias sl="ls"
alias senv="cd ~/Work/Freelancer; source services_env/bin/activate;"
export ENVIRONMENT="staging-local"
## end work section ##

export EDITOR=vim

autoload -U autocd
setopt autocd
setopt extendedglob
zstyle ':completion:*' menu select

if [[ $SSH_CONNECTION == "" ]]; then
    eval `keychain --eval keychain $(ls ~/.ssh | grep -v pub | grep -v authorized_keys | grep -v known_hosts | grep -v config) `
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1

export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
alias j="jump"

#### Folder jumping / marking
function mark {
    mkdir -p $MARKPATH; ln -s "$(pwd)" $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function _marks {
    reply=($(ls $MARKPATH))
}
compctl -K _marks jump
compctl -K _marks unmark
#### End folder jumping / marking


expand-or-complete-with-dots() {
    echo -n "\e[31m...\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

export VIRTUALENVWRAPPER_PYTHON=`which python2 || which python`
export WORKON_HOME=$HOME/virtual_envs
mkdir -p $WORKON_HOME
source `which virtualenvwrapper.sh`
