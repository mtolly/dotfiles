function open
  if [ (uname -s) = "Darwin" ]
    /usr/bin/open $argv
  else
    exo-open $argv > /dev/null ^ /dev/null
  end
end
