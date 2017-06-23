set WINEPREFIX $HOME/.wine

if [ (uname -s) = "Darwin" ]
  set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH
end

if test -d $HOME/.local/bin
  set PATH $HOME/.local/bin $PATH
end
set EDITOR 'subl --wait'

set PATH $HOME/.stack/programs/x86_64-*/ghc-8.0.2/bin/ $PATH

alias git hub

alias gs "git status"

function .
  open .
end

set -x DEVKITPRO $HOME/devkitPro
if test -d $DEVKITPRO
  set -x DEVKITARM $DEVKITPRO/devkitARM
  set PATH $DEVKITARM/bin $PATH
end

if test -d $HOME/.cargo/bin
  set PATH $HOME/.cargo/bin $PATH
end

if [ (uname -s) = "Darwin" ]
  set -x ANDROID_HOME $HOME/Library/Android/sdk/
  if test -d $ANDROID_HOME
    set PATH $PATH $ANDROID_HOME/platform-tools
  end
end
