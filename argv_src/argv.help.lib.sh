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
