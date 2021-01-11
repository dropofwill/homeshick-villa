WD="/Users/wpaul/Code/scripts"

function mvnt () {
  $WD/run-mvn-test.sh $1 $2
}

funtion mvn-quiet-env () {
  export MAVEN_OPTS="$MAVEN_OPTS -Dorg.slf4j.simpleLogger.defaultLogLevel=error"
}

# Run a simple ruby server on port 3000 in the current dir
# or another port that you pass in
function serve {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}

# Show dotfiles in Finder or not?
function hidefiles(){
  defaults write com.apple.finder AppleShowAllFiles -bool NO
  killall Finder
}

function showfiles(){
  defaults write com.apple.finder AppleShowAllFiles -bool YES
  killall Finder
}

# Swap between vim and zsh with <C-z> seamlessly
function fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Open all git unstaged changes in your configured editor
# usage: gfix
function gfix() {
  $EDITOR $(git diff --name-only --relative $(pwd) | uniq)
}

function gdcfix() {
  $EDITOR $(git diff --cached --name-only --relative $(pwd) | uniq)
}

# Open all files that match an ag query
# usage: afix ContactsService
function afix() {
  $EDITOR $(ag -l $1)
}

#
# usage: git-ratio
function git-ratio() {
  git log --pretty=format:%ae --numstat --diff-filter=M --no-merges | gawk '
  /./ && !author {
      author = tolower($0);
      next
    }
    author {
      ins[author] += $1;
      del[author] += $2
    }
    /^$/ {
      author = ""; next
    }
    END {
      for (a in ins) {
        ratio = Infinity
        if (del[a] != 0) {
          ratio = sprintf("%10.2f", ins[a] / del[a])
        }
        printf "%s %10d %10d %s\n", ratio, ins[a], del[a], a
      }
   }' | sort -n
}

# TODO make test path passable/globbable for multi-module and non-java apps
function git-ratio-no-test() {
  git log --pretty=format:%ae --numstat --diff-filter=M --no-merges -- . ":^src/test" | gawk '
  /./ && !author {
      author = tolower($0);
      next
    }
    author {
      ins[author] += $1;
      del[author] += $2
    }
    /^$/ {
      author = ""; next
    }
    END {
      for (a in ins) {
        ratio = Infinity
        if (del[a] != 0) {
          ratio = sprintf("%10.2f", ins[a] / del[a])
        }
        printf "%s %10d %10d %s\n", ratio, ins[a], del[a], a
      }
   }' | sort -n
}

# How many lines of code at HEAD were each author responsible for
# usage: git-authors **/*.java
function git-authors() {
  git ls-tree -r -z --name-only HEAD -- $1 | \
    xargs -0 -n1 git blame --line-porcelain HEAD | \
    grep  "^author-mail " | \
    sort | \
    uniq -c | \
    sort -nr
}

switch_profile() {
  echo -e "\033]50;SetProfile=$1\a"
  ITERM_PROFILE=$1
  clear
}

sub_dates() {
  StartDate=$(gdate -u -d "$1" +"%s")
  FinalDate=$(gdate -u -d "$2" +"%s")
  gdate -u -d "0 $FinalDate sec - $StartDate sec"
}

kill_av() {
  while true; do
    sudo killall falcond
    sudo killall SophosScanD
    sleep 5;
  done
}
