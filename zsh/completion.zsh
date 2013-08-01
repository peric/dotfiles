# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending


# Symfony 2 completition
_symfony2_get_command_list () {
  php app/console --no-ansi | sed "1,/Available commands/d" | awk '/^  [a-z]+/ { print $1 }'
}

_symfony2 () {
  if [ -f app/console ]; then
    compadd `_symfony2_get_command_list`
  fi
}

compdef _symfony2 app/console
compdef _symfony2 sf

#Alias
alias sf='php app/console'
alias sfcl='php app/console cache:clear'
alias sfroute='php app/console router:debug'
alias sfgb='php app/console generate:bundle'
