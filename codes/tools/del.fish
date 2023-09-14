function tools_del
    if test -z $argv[1]
        logger 5 "Nothing to delete,abort"
        return 1
    else
        if test -e "$root"/codes/$argv[1].fish
            rm "$root"/codes/$argv[1].fish
            printf "[DEL] $date -> "$dirname"_"$basename"\n" >> "$root"/configs/function.history
        else
            logger 5 "File this name not found, action failed"
            return 1
        end
    end
end
