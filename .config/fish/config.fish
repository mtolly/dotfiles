# Greeting mesage
set fish_greeting

# PATH

# Use homebrew stuff before pre-installed stuff
set PATH /usr/local/bin $PATH

# GHC from http://ghcformacosx.github.io/
set -x GHC_DOT_APP /Applications/ghc-7.10.2.app
set PATH $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH

# GHCJS binaries
set PATH $HOME/ghcjs/.cabal-sandbox/bin $PATH

# subl
set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

# my bin/ folder + sandboxed hs programs
set PATH $HOME/bin $HOME/bin/.cabal-sandbox/bin $PATH

# Use Homebrew's PHP
# set PATH (brew --prefix homebrew/php/php55)/bin $PATH

# Android SDK
set -x ANDROID_HOME /Users/mtolly/Library/Android/sdk/

# MacPorts
set PATH /opt/local/bin /opt/local/sbin $PATH
set -x MANPATH "" /opt/local/share/man $MANPATH

# Nethack
set PATH /usr/games/bin/ $PATH
set -x MANPATH "" /usr/games/man $MANPATH

# LilyPond
set PATH /Applications/LilyPond.app/Contents/Resources/bin $PATH

# for jammittools & onyxbuild
set -x JAMMIT "$HOME/Downloads/music (on passport)/Jammit (on passport)"

# devkitpro
set -x DEVKITPRO /opt/devkitpro
set -x DEVKITARM $DEVKITPRO/devkitARM
set PATH $PATH $DEVKITARM/bin

# mentioned in byobu homebrew caveats
set -x BYOBU_PREFIX (brew --prefix)

set -x PKG_CONFIG_PATH /opt/X11/lib/pkgconfig
set -x C_INCLUDE_PATH /opt/X11/include

# stack-installed programs
set PATH $HOME/.local/bin $PATH

# Android tools
set PATH $HOME/Library/Android/sdk/platform-tools $PATH
set PATH $HOME/Library/Android/sdk/tools $PATH
set PATH $HOME/Library/Android/sdk/build-tools/22.0.1 $PATH

# Go
set -x GOPATH $HOME/go
set PATH /usr/local/opt/go/libexec/bin $PATH

# Aliases
alias gs "git status"
alias cri "cordova run ios"
alias cra "cordova run android"
alias cid "cabal install --only-dependencies"
alias cb "cabal build"
alias cbjs "cabal configure --ghcjs; and cabal build"
alias lilyrepl "rlwrap lilypond scheme-sandbox"
alias lx "exa -lh --git"
