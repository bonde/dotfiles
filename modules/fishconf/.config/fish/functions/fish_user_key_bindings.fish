function fish_user_key_bindings --description 'Define user key bindings'
  # Unbind some existing bindings
  bind --erase \cf forward-char
  bind --erase \cb backward-char

  bind \e\n forward-char
  bind \e\r forward-char
  bind \el forward-char

  bind \eh backward-char

  bind \ej down-or-search
  bind \ek up-or-search

  bind \e. history-token-search-forward
  bind \e, history-token-search-backward
end
