# My Custom aliases
alias install="sudo apt install"
alias open="xdg-open"
alias robmux="tmux new-session -A -s robmux"
alias ca="conda activate"

# Shows conda env and git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="$PS1\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ "

# Environment Variables
