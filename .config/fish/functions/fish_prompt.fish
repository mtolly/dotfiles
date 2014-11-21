# simple port of bira.zsh-theme

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt --description 'Write out the prompt'

	echo -n "╭─"
	set_color $fish_color_user
	echo -n (whoami)
	set_color normal
	echo -n @
	set_color $fish_color_host
	echo -n (hostname -s)

	echo -n "  "
	set_color $fish_color_cwd
	echo -n (prompt_pwd)

  if [ (_git_branch_name) ]
    set_color yellow
    set -l git_branch (_git_branch_name)
    if [ (_git_is_dirty) ]
      set git_info '<'$git_branch"*"'>'
    else
      set git_info '<'$git_branch'>'
    end
    echo -n "  $git_info"
  end

  echo

	set_color normal
	echo -n "╰─\$ "

end

function fish_right_prompt
  set -l last_status $status

  if not test $last_status -eq 0
    # todo: right-justify
    set_color $fish_color_error
    echo "$last_status ↵ "
    set_color normal
    echo
  end
end
