# Set umask
umask 0007

if status is-interactive
  # Remove greeting message
  set -g fish_greeting

  starship init fish | source

  # Settings for aws-vault
  set -gx AWS_VAULT_PROMPT ykman

  # Override terragrunt with opentofu
  set -gx TERRAGRUNT_TFPATH 'tofu' 

  # Settings for GPG
  set -gx GPG_TTY (tty)

  # Load Homebrew
  # eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  set -gx HOMEBREW_NO_ENV_HINTS 1
  set -gx HOMEBREW_NO_ANALYTICS 1
  #set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
  if test (uname -s) = Darwin
      eval (/opt/homebrew/bin/brew shellenv)
  else if test (uname -s) = Linux
      eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  end

  # Update PATH
  if test (uname -s) = Darwin
      # Use GNU utils
      #fish_add_path --prepend --move (brew --prefix coreutils)/libexec/gnubin (brew --prefix)/opt/gnu-sed/libexec/gnubin
      #set -gx MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH
      fish_add_path --prepend --move (brew --prefix)/opt/gnu-sed/libexec/gnubin
  end
  fish_add_path --prepend --move $HOME/bin $HOME/.local/bin $HOME/.krew/bin/ $HOME/go/bin/ $HOME/Skyscrapers/skyscrapers-tools/bin

  # Load completions
  if test -d (brew --prefix)"/share/fish/completions"
      set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
  end
  if test -d (brew --prefix)"/share/fish/vendor_completions.d"
      set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
  end

  for file in ~/.config/fish/completions/*.fish
      source $file
  end

  source ~/.secrets.sh
end
