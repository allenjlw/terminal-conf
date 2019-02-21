# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg[red]%}[%{$reset_color%}%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}%{$fg[red]%}]%{$reset_color%}'
    local user_symbol='%{$fg[red]%}[%{$reset_color%}%B#%b%{$fg[red]%}]%{$reset_color%}'
else
    local user_host='%{$fg[red]%}[%{$reset_color%}%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}%{$fg[red]%}]%{$reset_color%}'
    local user_symbol='%{$fg[red]%}[%{$reset_color%}%B$%b%{$fg[red]%}]%{$reset_color%}'
fi

local current_dir='%{$fg[red]%}[%{$reset_color%}%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}%{$fg[red]%}]%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}[%{$reset_color%}%{$fg[yellow]%}‹$(rvm-prompt i v g)›%{$reset_color%}%{$fg[red]%}]%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}[%{$reset_color%}%{$fg[yellow]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}%{$fg[red]%}]%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'
local timestamp='%{$fg[red]%}[%{$reset_color%}%D{%k:%M:%S}%{$fg[red]%}]%{$reset_color%}'

PROMPT="%{$fg[red]%}┌%{$reset_color%}${user_host}${current_dir}${rvm_ruby}${git_branch}
%{$fg[red]%}└${timestamp}%{$reset_color%}${user_symbol}"
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"


