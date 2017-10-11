#!/bin/sh
#
# DO NOT CHANGE THE EXECUTE RIGHT OF THIS SCRIPT!!!
#
# Script to set local pre-commit git-hook as a symlink to the actual pre-commit
# script which is maintained within the remote repo.
#
# How to install:
# 1. open your terminal (bash)
# 2. cd to your local repo of this project
# 3. git pull origin master (you will find git-hooks dir in your local repo)
# 4. cd to git-hooks dir
# 5. ./hook-setup.sh (run this script)
# 6. now, you have a pre-commit hook in your local repo, which will run static analysis
#    before each of your commit
# 7. enjoy!
#

# get the dir of local hooks
GITHOOKS_DIR=$(git rev-parse --show-toplevel)/.git/hooks
# get the dir of repo hooks
REPOHOOKS_DIR=$(git rev-parse --show-toplevel)/git-hooks

# if pre-commit is already exists in local, then back it up
if [ -e "$GITHOOKS_DIR/pre-commit" ]; then
    mv $GITHOOKS_DIR/pre-commit $GITHOOKS_DIR/pre-commit.old
fi

# symlink local pre-commit hook to repo actual hook
ln -s -f $REPOHOOKS_DIR/pre-commit $GITHOOKS_DIR/pre-commit
