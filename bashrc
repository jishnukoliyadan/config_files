# Custom aliases
alias install="sudo apt install"
alias open="xdg-open"
alias robmux="tmux new-session -A -s robmux"
alias ca="conda activate"

# Custom eza aliases
alias el="eza -l --icons --git -a"
alias elt="eza --tree --level=2 --long --icons --git"

# Custom Git aliases
alias gl='git log'
alias ga='git add'
alias gs='git status'
alias gr='git remote -v'
alias adog='git log --all --decorate --oneline --graph --color=always'
alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s%C(bold)%Cred%d%Creset" --decorate --graph'
alias glpo='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s%C(bold)%Cred%d%Creset"'
alias gtree='git ls-files | tree --fromfile'
#alias gtree='git ls-tree --full-tree -r --name-only HEAD | awk -F/ '\''{for (i=1; i<NF; i++) printf "  |"; print "  └── "$NF}'\'''

# Git clone using SSH
gclone() {
    # Simplifies the process of cloning GitHub repositories using SSH.
    # Instead of full SSH URL, users can simply provide "user/repo".

    repo="$1"

    # Check if the provided repository name already ends with ".git"
    if [[ "$repo" != *.git ]]; then
        # If not, appends ".git" to ensure proper SSH URL format
        repo="$repo.git"
    fi

    # Clone the repository using the dynamically constructed SSH URL
    git clone "git@github.com:$repo"

    # Example usage:
    # gclone user/repo     --> Clones git@github.com:user/repo.git
    # gclone user/repo.git --> Clones git@github.com:user/repo.git (unchanged)
}

# Git clone using HTTPS
ghclone() {
    # Simplifies the process of cloning GitHub repositories using HTTPS.
    # Instead of HTTPS URL with an authentication token, users can simply provide "user/repo".

    repo="$1"
    
    # Construct the HTTPS URL with the GitHub token for authentication
    # The $GIT_TOKEN environment variable holds your GitHub authentication token
    repo="https://$GIT_TOKEN@github.com/$repo"
    
    # Check if the repository name does not end with ".git"
    if [[ "$repo" != *.git ]]; then
        # If ".git" is missing, append ".git" to the repository path to form a valid Git URL
        repo="$repo.git"
    fi
    
    # Clone the repository using the dynamically constructed HTTPS URL
    git clone "$repo"

    # Example usage:
    # gclone user/repo     --> Clones https://$GIT_TOKEN@github.com/user/repo.git
    # gclone user/repo.git --> Clones https://$GIT_TOKEN@github.com/user/repo.git (unchanged)
}

# Shows conda env and git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="$PS1\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ "

# Environment Variables
