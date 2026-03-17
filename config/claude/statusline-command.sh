#!/usr/bin/env bash
# Claude Code status line — Catppuccin Mocha powerline prompt

input=$(cat)

# Catppuccin Mocha palette
fg_crust='\033[38;2;17;17;27m'
fg_red='\033[38;2;243;139;168m'
fg_peach='\033[38;2;250;179;135m'
fg_yellow='\033[38;2;249;226;175m'
fg_green='\033[38;2;166;227;161m'
fg_sapphire='\033[38;2;116;199;236m'
fg_lavender='\033[38;2;180;190;254m'

bg_red='\033[48;2;243;139;168m'
bg_peach='\033[48;2;250;179;135m'
bg_yellow='\033[48;2;249;226;175m'
bg_green='\033[48;2;166;227;161m'
bg_sapphire='\033[48;2;116;199;236m'
bg_lavender='\033[48;2;180;190;254m'

reset='\033[0m'

# Data from Claude Code
cwd=$(echo "$input" | jq -r '.cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // .model // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
duration_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // empty')

# Shorten path
short_path=""
if [ -n "$cwd" ]; then
  short_path="${cwd/#$HOME/\~}"
  short_path=$(echo "$short_path" | awk -F'/' '{
    n=NF; if(n>3){printf "…/"; for(i=n-2;i<=n;i++) printf "%s%s",$i,(i<n?"/":"")} else print $0
  }')
fi

# Git info
git_branch=""
git_status_str=""
if git -C "$cwd" rev-parse --git-dir --no-optional-locks >/dev/null 2>&1; then
  git_branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
               || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  git_flags=$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)
  modified=$(echo "$git_flags" | grep -c '^ M\|^M ' 2>/dev/null || true)
  untracked=$(echo "$git_flags" | grep -c '^??' 2>/dev/null || true)
  staged=$(echo "$git_flags" | grep -c '^[MADRC]' 2>/dev/null || true)
  [ "$modified" -gt 0 ]  && git_status_str+="!"
  [ "$untracked" -gt 0 ] && git_status_str+="?"
  [ "$staged" -gt 0 ]    && git_status_str+="+"
fi

# Format duration
dur=""
if [ -n "$duration_ms" ] && [ "$duration_ms" -gt 0 ] 2>/dev/null; then
  total_s=$(( duration_ms / 1000 ))
  h=$(( total_s / 3600 ))
  m=$(( (total_s % 3600) / 60 ))
  if [ "$h" -gt 0 ]; then
    dur="${h}h${m}m"
  else
    dur="${m}m"
  fi
fi

# Format cost
cost_fmt=""
if [ -n "$cost" ]; then
  cost_fmt=$(printf '$%.2f' "$cost")
fi

# Build the line
line=""

# Red: OS icon + username
line+="${fg_red}\xee\x82\xb6${reset}"
line+="${bg_red}${fg_crust} \xf3\xb0\x80\xb5 $(whoami) ${reset}"

# Peach (orange): directory
line+="${fg_red}${bg_peach}\xee\x82\xb0${reset}"
line+="${bg_peach}${fg_crust} ${short_path} ${reset}"

# Yellow: git branch + status
if [ -n "$git_branch" ]; then
  line+="${fg_peach}${bg_yellow}\xee\x82\xb0${reset}"
  line+="${bg_yellow}${fg_crust} \xef\x90\x98 ${git_branch}"
  [ -n "$git_status_str" ] && line+=" ${git_status_str}"
  line+=" ${reset}"
  next_fg=$fg_yellow
else
  next_fg=$fg_peach
fi

# Green: model + context %
line+="${next_fg}${bg_green}\xee\x82\xb0${reset}"
line+="${bg_green}${fg_crust} \xf3\xb0\xa7\x91 ${model}"
[ -n "$used_pct" ] && line+=" [${used_pct}%]"
line+=" ${reset}"

# Sapphire: cost
if [ -n "$cost_fmt" ]; then
  line+="${fg_green}${bg_sapphire}\xee\x82\xb0${reset}"
  line+="${bg_sapphire}${fg_crust} ${cost_fmt} ${reset}"
  next_fg2=$fg_sapphire
else
  next_fg2=$fg_green
fi

# Lavender: duration
if [ -n "$dur" ]; then
  line+="${next_fg2}${bg_lavender}\xee\x82\xb0${reset}"
  line+="${bg_lavender}${fg_crust} \xf3\xb0\x85\x90 ${dur} ${reset}"
  line+="${fg_lavender}\xee\x82\xb4${reset}"
else
  line+="${next_fg2}\xee\x82\xb4${reset}"
fi

printf '%b\n' "$line"
