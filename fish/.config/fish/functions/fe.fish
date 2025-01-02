function fe --description "alias fe=fzf -m --preview='bat --color=always {}' --bind 'enter:become(code {+})'"
  fzf -m --preview='bat --color=always {}' --bind 'enter:become(code {+})'
end
