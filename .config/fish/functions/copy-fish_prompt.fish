function fish_prompt
  set the_status $status
  echo -n "["
  set_color purple
  echo -n (prompt_pwd)
  set_color normal
  echo -n "]"
  set the_git_status (git status --porcelain 2> /dev/null)
  if test "$the_git_status" != ""
    echo -n "*"
  end
  if test "$the_status" -ne 0
    set_color red
    echo -n "! "
    set_color normal
  else
    echo -n ": "
  end
end
