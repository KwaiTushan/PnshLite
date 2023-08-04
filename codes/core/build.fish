function build_def
    if set -q argv[1]
        set product $argv[1]
    else
        set product product
    end
    echo -n "" >"$root/$product"
    logger 0 "Collecting blocks"
    set counter_mods (cat "$root"/configs/pnsh.mod | count)
    set counter_blocks (find "$root"/codes -type f 2>/dev/null | sed 's|^./||' | count)
    set counter (math "$counter_mods+$counter_blocks")
    set counter_built 0
    set perc 0
    logger 1 "Start building"
    for mod in (cat "$root"/configs/pnsh.mod)
        set perc (math -s0 "($counter_built/$counter)*100")
        echo "[$perc% $counter_built/$counter] Building "$root"/libs/$mod."
        cat "$root"/libs/$mod >>"$root/$product"
        echo >>"$root/$product"
        set counter_built (math "$counter_built+1")
    end
    for blocks in (find "$root"/codes -type f | sed 's|^./||')
        set perc (math -s0 "($counter_built/$counter)*100")
        echo "[$perc% $counter_built/$counter] Building "$root"/$blocks."
        cat "$root"/$blocks >>"$root/$product"
        echo >>"$root/$product"
        set counter_built (math "$counter_built+1")
    end
    cat "$root"/configs/main.fish >>"$root/$product"
    chmod +x "$root/$product"
    logger 2 Built
end
