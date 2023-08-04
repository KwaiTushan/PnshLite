function push
    if [ "$argv" = "" ]
        set commit_msg (date +"%Y-%m-%d_%T" -u)
    else
        set commit_msg $argv
    end
    cd "$root"
    git add .
    git commit -m $commit_msg
    git push
end
