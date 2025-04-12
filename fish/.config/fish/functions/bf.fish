function bf --description "alias bf=fzf, preview and open with bat --plain --no-pager"
  fzf -m --preview='bat --color=always {}' --bind 'enter:become(bat {} --no-pager --plain)'
end
