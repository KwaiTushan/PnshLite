function init
    #Structure
    mkdir -p "$root"/codes "$root"/configs "$root"/libs
    #<=configs
    echo 'set -x prefix 
switch $argv[1]
end' >"$root"/configs/main.fish
    echo 'header
logger
help_echo' >"$root"/configs/pnsh.mod
    #<=libs
    echo "#!/usr/bin/fish" >"$root"/libs/header
    echo 'function logger-warn
set_color magenta
echo "$prefix ! $argv[1..-1]"
set_color normal
end
function logger-error
set_color red
echo "$prefix x $argv[1..-1]"
set_color normal
end
function logger-info-start
set_color normal
echo "$prefix + $argv[1..-1]"
set_color normal
end
function logger-info-end
set_color normal
echo "$prefix - $argv[1..-1]"
set_color normal
end
function logger-debug
set_color yellow
echo "$prefix ? $argv[1..-1]"
set_color normal
end
function logger-success
set_color green
echo "$prefix √ $argv[1..-1]"
set_color normal
end
function logger -d "a lib to print msg quickly"
switch $argv[1]
    case 0
        logger-info-start $argv[2..-1]
    case 1
        logger-info-end $argv[2..-1]
    case 2
        logger-success $argv[2..-1]
    case 3
        logger-debug $argv[2..-1]
    case 4
        logger-warn $argv[2..-1]
    case 5
        logger-error $argv[2..-1]
end
end' >"$root"/libs/logger
    echo "function help_echo
echo '(./)app'
end
" >"$root"/libs/help_echo
    logger 2 Initialized
end
