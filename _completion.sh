#!/bin/bash
#

# switch parameter-completion
# This file supports parameter completion for the switch script.  It will
# attempt to find a "conf" folder in the current folder, and will list the
# names of the *.conf files in that folder.

_SwitchGetCon ()   #  By convention, the function name
{                  #+ starts with an underscore.
  local cur
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.

  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  
  # If the conf folder doesnt exist, return no results
  if [ ! -e 'conf' ]
    then
        return 0
  fi
  COMPREPLY=( $( compgen -W '$(cd conf; ls *.conf | sed -e "s/\.conf//g")' -- $cur ) )
#   Generate the completion matches and load them into $COMPREPLY array.
#   xx) May add more cases here.
#   yy)
#   zz)

  return 0
}

complete -F _SwitchGetCon ./switch

