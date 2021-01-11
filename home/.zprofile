# Add Cassandra CLI to PATH for scripting
export PATH="$PATH:$HOME/dse/bin"

export FINDBUGS_HOME=/usr/local/opt/findbugs/libexec

export ECR_SYNDICATION="799085920191.dkr.ecr.us-east-1.amazonaws.com"

alias java7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias java8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias java9='export JAVA_HOME=$(/usr/libexec/java_home -v 1.9)'
alias java10='export JAVA_HOME=$(/usr/libexec/java_home -v 10.0)'
alias java11='export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.2)'
alias javaGraal11='export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.7)'
# java11

# for native-image support
# export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.1.0/Contents/Home/bin:$PATH
# coursier scala path
export PATH="$PATH:/Users/wpaul/Library/Application Support/Coursier/bin"

alias gcnv='git commit --no-verify'

export VAGRANT_DEFAULT_PROVIDER=virtualbox
# export MANPAGER="col -b | nvim --noplugin -c 'set ft=man ts=8 nomod nolist nonu noma' -"
export PATH=/usr/local/bin:$PATH

# AWS Go SDK wants this
export AWS_SDK_LOAD_CONFIG=0

# export FZF_DEFAULT_COMMAND='
#   (git ls-tree -r --name-only HEAD ||
#    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
#       sed s/^..//) 2> /dev/null'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# NVM is extremely slow (2 seconds) no reason to load it for every session
function use_nvm() {
  export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"

  # Add tab completion to NPM
  . <(npm completion)
}

# lazynvm() {
#   unset -f nvm node npm npx
#   export NVM_DIR="$HOME/.nvm"
#   . "$(brew --prefix nvm)/nvm.sh"
#
#   # Add tab completion to NPM
#   . <(npm completion)
# }
#
# nvm() {
#   lazynvm
#   nvm $@
# }
#
# node() {
#   lazynvm
#   node $@
# }
#
# npm() {
#   lazynvm
#   npm $@
# }
#
# npx() {
#   lazynvm
#   npx $@
# }

# A lot less slow (0.3 seconds), but still
function use_python() {
  export PATH=/usr/local/anaconda3/bin:"$PATH"
  # Add pyenv to the path
  export PYENV_ROOT=/usr/local/var/pyenv

  # pyenv autocomplete
  if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
}

# opam configuration
test -r /Users/wpaul/.opam/opam-init/init.zsh && . /Users/wpaul/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

function use_ruby() {
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
}

# $(brew --prefix asdf)/asdf.sh
# $(brew --prefix asdf)/completion/asdf.bash

# function use_asdf() {
#   . $HOME/.asdf/asdf.sh
#   . $HOME/.asdf/completions/asdf.bash
# }

export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Use buildkit for docker
export DOCKER_BUILDKIT=1
# And docker-compose
export COMPOSE_DOCKER_CLI_BUILD=1
