function chk
    switch $argv[1]
        case rw
            if test -w $argv[2]
                return 0
            else
                logger 5 "Not writable"
                exit 1
            end
    end
end
