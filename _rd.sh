#!/bin/env bash

rd_version='0.1.1a'

rd_url='https://raw.githubusercontent.com/romandobra/snips/main'

[ -z $3 ] || {
    rd_new_version=$( wget --no-cache --no-cookies -qO - $rd_url/_rd.sh | grep -m 1 "rd_version=" | cut -d"'" -f2; )
    echo $rd_new_version
}

exit 0

#https://api.github.com/repos/romandobra/snips/git/trees/master
#https://api.github.com/repos/{owner}/{repo}/contents/{path}

