# Greeting mesage
set fish_greeting

# PATH

# Use homebrew stuff before pre-installed stuff
set PATH /usr/local/bin $PATH

# GHC from http://ghcformacosx.github.io/
set -x GHC_DOT_APP /Applications/ghc-7.8.3.app
set PATH $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH

# GHCJS binaries
set PATH $HOME/ghcjs/.cabal-sandbox/bin $PATH

# subl
set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

# my bin/ folder + sandboxed hs programs
set PATH $HOME/bin $HOME/bin/.cabal-sandbox/bin $PATH

# Use Homebrew's PHP
set PATH (brew --prefix homebrew/php/php55)/bin $PATH

# Android SDK
set -x ANDROID_HOME /usr/local/opt/android-sdk

# MacPorts
set PATH /opt/local/bin /opt/local/sbin $PATH
set -x MANPATH "" /opt/local/share/man $MANPATH

# Nethack
set PATH /usr/games/bin/ $PATH
set -x MANPATH "" /usr/games/man $MANPATH

# Aliases
alias gs "git status"
alias cri "cordova run ios"
alias cid "cabal install --only-dependencies"
alias cb "cabal build"
