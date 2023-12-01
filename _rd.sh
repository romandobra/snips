#!/bin/env bash

rd_version='0.1.4a'

# change version when updating rd_list
rd_list="chrome \
shitrix \
sql \
mysqldump"

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

[ -z $1 ] && {
    echo "Usage: $0 grep_params|pattern|dot_for_whole_file filename|pattern"
    exit 1
}

rd_grep="grep $1"

rd_wget(){
    wget -qO - $rd_url/files/$1 | {
        [ -z $2 ] && {
            cat -
        } || {
            [ "x$2" == 'x.' ] && {
                cat -
            } || {
                $rd_grep
            }
        }
    }
}

for file in ${rd_list}; do

#   if filename is given
    [ ! -z $2 ] && {

#       if filename exact
        [ $2 == $file ] && {
            rd_wget $file $1
            exit 0
        }

#       if filename match
        case "$file" in *$2* )
            echo "- $file:"
            rd_wget $file $1;;
        esac || continue
    } || {

#   if filename is not given
        echo "- $file:"
        rd_wget $file $1
    }

done

exit 0
