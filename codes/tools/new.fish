function new
    if test -z $argv[1]
        logger 5 "Nothing to create,abort"
        exit 1
    else
        set basename (basename $argv[1])
        if test -e "$root"/codes/$argv[1].fish
            logger 3 "File this name existed,overwrite it?"
            read -n1 -P "[y/n] " _delete_var_
            switch $_delete_var_
                case Y y
                    echo -n "" >"$root"/codes/$argv[1].fish
                case N n '*'
                    logger 5 "User Aborted"
                    exit 1
            end
        end
        if mkdir -p "$root"/codes/(dirname $argv[1])
            set func_prename (dirname $argv[1])
            set date (date)
            if test -z "$func_prename"
            else
                set func_prename (dirname $argv[1] | string replace '/' '_')
            end
            printf "function "$func_prename"_"$basename"\n\nend" >"$root"/codes/$argv[1].fish
            printf "$date -> "$func_prename"_"$basename"\n" >> "$root"/configs/function.history
            logger 2 Done
        else
            logger 5 Failed
        end
    end
end
