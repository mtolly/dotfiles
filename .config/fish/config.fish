set WINEPREFIX $HOME/.wine

if [ (uname -s) = "Darwin" ]
  set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH
end

if test -d $HOME/.local/bin
  set PATH $HOME/.local/bin $PATH
end
set EDITOR 'subl --wait'

alias git hub

alias gs "git status"

function .
  open .
end

if [ (uname -s) = "Darwin" ]
  set -x ANDROID_HOME $HOME/Library/Android/sdk/
  if test -d $ANDROID_HOME
    set PATH $PATH $ANDROID_HOME/platform-tools
  end
end

set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

set fish_greeting
