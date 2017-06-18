set WINEPREFIX $HOME/.wine

# set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

set PATH $HOME/.local/bin $PATH
set EDITOR 'subl --wait'

# set PATH $HOME/.stack/programs/x86_64-osx/ghc-8.0.1/bin/ $PATH

alias git hub

alias gs "git status"
# alias lilyrepl "rlwrap lilypond scheme-sandbox"

function .
  open .
end

set -x DEVKITPRO $HOME/devkitPro
set -x DEVKITARM $DEVKITPRO/devkitARM
set PATH $DEVKITARM/bin $PATH

set PATH $HOME/.cargo/bin $PATH
set -x JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
set -x ANDROID_HOME $HOME/android/
set PATH $PATH $JAVA_HOME/jre/bin
set PATH $PATH $ANDROID_HOME/platform-tools
