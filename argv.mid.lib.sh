###############################################################################
##Copyright (C) Anton Riabchevskiy (AntonRiab)
##Middle part
###############################################################################
 help() {
    ALL_HELPS=$(cat "$0" | sed -rn '/^[0-9A-Za-z_]+_help=/{s/_help=.*$//p}')
    FUNC_W_HELP=$(printf "$ALL_HELPS\n$AF\n" | sort | uniq -D | uniq)
    VAR_W_HELP=$(printf "$ALL_HELPS\n$FUNC_W_HELP\n" | sort | uniq -u)

    test "$GLOBAL_HELP" && echo $GLOBAL_HELP

    test -z "$VAR_W_HELP$FUNC_W_HELP" \
        && printf "Avalible functions:\n$(echo "$AF" | sed 's/^/\t--/g')\n" \
        && exit 0

    test "$VAR_W_HELP" \
        && echo "Avalible variables:" && eval $(echo "$VAR_W_HELP" \
            | sed -r 's/(.*)/printf "\t\1=\\\"$\1\\\"\t- $\1_help\n"/;')

    test "$FUNC_W_HELP" \
        && echo "Avalible functions:" &&  eval $(echo "$FUNC_W_HELP" | \
            sed -r 's/(.*)/printf "\t--\1\t- $\1_help\n"/;')

    return 0
}
###############################################################################
##Copyright (C) Anton Riabchevskiy (AntonRiab)
##Small integration argv.low.lib.sh
###############################################################################
IFS=$(printf " \t\n");DEFAULT_FUNCTION=${DEFAULT_FUNCTION:-"help"}
AF="$(cat $0 | sed -rn 's/^([0-9a-zA-Z_]*)\(\) *\{/\1/p')"
test $# -lt 1 && F=$DEFAULT_FUNCTION || F=$@
test "$(echo $F | grep -i help)" -o ! "$F" \
  && test -z "$(type help | grep funct)" && echo "$AF" | sed 's/^/\t--/' && exit 0
 rf() { F="$1" TR=$(printf "help\n$AF\n" | grep "^$F$")
    test ! "$TR" && echo "No function $F avalible!" && return
    if [ $# -lt 2 ]; then eval "$TR"; return $?; fi
    shift && eval "$TR $@"
}
IFS='#';for i in $(echo "$F" | sed 's/ *--/#/g;s/^#//');do IFS=' ';rf $i;done
