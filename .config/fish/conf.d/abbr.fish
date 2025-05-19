# ls
abbr l 'eza -lgh'
abbr la 'eza -lgha'

# shortcuts
abbr k kubectl
abbr kube-dashboard 'kubectl auth-proxy -n kubernetes-dashboard https://kubernetes-dashboard.svc'
abbr fly-clean 'fly prune-worker --all-stalled'
abbr tfdocs terraform-docs
abbr sso-login 'aws sso login --sso-session SkyscrapersSSO'
# I want unset
abbr unset 'set -e'

# Git
abbr cdroot 'cd $(git rev-parse --show-toplevel)'
abbr gitlog "git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
abbr gitclean "git branch -a | grep -v master | grep -v main | grep -v remotes | xargs git branch -D"
abbr gitclean-recursively 'find . -maxdepth 3 -type d -exec sh -c "cd {}; pwd; git branch -a | grep -v master | grep -v main | grep -v remotes | xargs git branch -D" \;'


# IP address
abbr myip 'dig +short myip.opendns.com @resolver1.opendns.com'

