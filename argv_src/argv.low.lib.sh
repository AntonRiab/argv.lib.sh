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
    test ! "$TR" && echo "No function $F available!" && return
    if [ $# -lt 2 ]; then eval "$TR"; return $?; fi
    shift && eval "$TR $@"
}
IFS='#';for i in $(echo "$F" | sed 's/ *--/#/g;s/^#//');do IFS=' ';rf $i;done
