set -x prefix [pnsh]
argparse -i -n "$prefix" 'd/root=' -- $argv
if set -q _flag_root
    set -x root "$_flag_root"
else
    set -x root .
end
switch $argv[1]
    case b build
        chk rw "$root"
        build_def $argv[2..-1]
    case n new
        chk rw "$root"
        if set -q $argv[3]
            for target in [2..-1]
                new $argv[2..-1]
            end
        else
            new $argv[2..-1]
        end
    case d del
        chk rw "$root"
        if set -q $argv[3]
            for target in [2..-1]
                tools_del $argv[2..-1]
            end
        else
            tools_del $argv[2..-1]
        end
    case i init
        if test -d "$root"
            init $argv[2..-1]
        else
            logger 3 "Directory existed or its parent dir is not existed, continue to overwrite?"
            read -n1 -P "[y/n] " prompt
            switch $prompt
                case y Y
                    init $argv[2..-1]
                case n N '*'
                    logger 5 "User abort"
                    exit 2
            end
        end
    case p push
        chk rw "$root"
        push $argv[2..-1]
    case v version
        logger 0 Nightingale@rev1445
    case h help '*'
        help_echo
end
