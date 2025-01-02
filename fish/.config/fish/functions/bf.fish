function bf --description "alias bf=fzf -m --preview='bat --color=always {}' --bind 'enter:become(bat {} --no-pager)'"
  fzf -m --preview='bat --color=always {}' --bind 'enter:become(bat {} --no-pager)'
end
