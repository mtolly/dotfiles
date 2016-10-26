set PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

set PATH $HOME/.local/bin $PATH

set PATH $HOME/.stack/programs/x86_64-osx/ghc-8.0.1/bin/ $PATH

alias git hub

alias gs "git status"
alias lilyrepl "rlwrap lilypond scheme-sandbox"

alias onyx "onyx --color --audio /Users/mtolly/Passport"

set PATH $HOME/mac_android/android-ndk-r12b $PATH
set PATH $HOME/mac_android/android-sdk-macosx/platform-tools $PATH
set -x JAVAHOME (/usr/libexec/java_home)
set -x ANDROID_HOME $HOME/mac_android/android-sdk-macosx

function .
  open .
end
