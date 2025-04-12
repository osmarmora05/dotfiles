function fe --description "alias fe=fzf, preview with bat and open with codium"
  fzf -m --preview='bat --color=always {}' --bind 'enter:become(code {+})'
end
