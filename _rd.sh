#!/bin/env bash

rd_version='0.1.3a'

# change version when updating rd_list
rd_list="chrome.sh \
shitrix.sh \
sql.sql \
mysqldump.sh"

rd_url='https://raw.githubusercontent.com/romandobra/snips/main'

wget --no-cache --no-cookies -qO /tmp/_rd_new.sh "$rd_url/_rd.sh?token=$(date +%s)"
rd_new_version=$( cat /tmp/_rd_new.sh | grep -m 1 "rd_version=" | cut -d"'" -f2; )
    
[ $rd_new_version == $rd_version ] || {
    read -p "Update $0 from $rd_version to $rd_new_version? [(n)|y]: "
    rd_update=${REPLY:-n}
    [ $rd_update == y ] && {
        echo "Updating..."
        (
            sleep 1
            cat /tmp/_rd_new.sh > $0
            echo; echo "Done! Please restart '$0 $@'"
            rm -rf /tmp/_rd_new.sh
        ) &
        exit 0
    }
    rm -rf /tmp/_rd_new.sh
}

rd_grep="grep $1"

rd_wget(){
    wget -qO - $rd_url/files/$1 | {
        [ -z $1 ] && {
            cat -
        } || {
            $rd_grep
        }
    }
}

for file in ${rd_list}; do
    echo "- $file:"
    rd_wget $file
done

exit 0
