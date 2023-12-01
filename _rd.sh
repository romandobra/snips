#!/bin/env bash

version='0.1.1a'

rd_url='https://raw.githubusercontent.com/romandobra/snips/main'

[ -z $3 ] || {
    wget --no-cache --no-cookies -qO - $rd_url/_rd.sh | grep -m 1 "version=" | cut -d"'" -f2
}

exit 0

#https://api.github.com/repos/romandobra/snips/git/trees/master
#https://api.github.com/repos/{owner}/{repo}/contents/{path}

