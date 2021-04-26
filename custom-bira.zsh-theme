# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..$FG[009]%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='$FG[009][%{$reset_color%}%{$terminfo[bold]$FG[009]%}%n@%m%{$reset_color%}$FG[009]]%{$reset_color%}'
    local user_symbol='$FG[009][%{$reset_color%}%B#%b$FG[009]]%{$reset_color%}'
else
    local user_host='$FG[009][%{$reset_color%}%{$terminfo[bold]%}$FG[154]%n@%m%{$reset_color%}$FG[009]]%{$reset_color%}'
    local user_symbol='$FG[009][%{$reset_color%}%B$%b$FG[009]]%{$reset_color%}'
fi

local current_dir='$FG[009][%{$reset_color%}%{$terminfo[bold]%}$FG[045]%~%{$reset_color%}$FG[009]]%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='$FG[009][%{$reset_color%}$FG[011]‹$(rvm-prompt i v g)›%{$reset_color%}$FG[009]]%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='$FG[009][%{$reset_color%}$FG[011]‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}$FG[009]]%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'
local timestamp='%{$FG[009]%}[%{$reset_color%}%D{%k:%M:%S}%{$FG[009]%}]%{$reset_color%}'

PROMPT="$FG[009]┌%{$reset_color%}${user_host}${current_dir}${rvm_ruby}${git_branch}
$FG[009]└%{$reset_color%}${user_symbol}"
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[011]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"


