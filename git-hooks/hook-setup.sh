#!/bin/sh
#
# Script to set local pre-commit git-hook as a symlink to the actual pre-commit
# script which is maintained within the remote repo.
#
# how to install:
# 1. open your terminal (bash)
# 2. cd to your local repo of this project
# 3. run git pull origin master (you will find git-hooks dir in your local repo)
# 4. cd to git-hooks dir
# 5. run ./hook-setup.sh
# 6. (if permission denied, run chmod -x ./hook-setup.sh, then run ./hook-setup.sh again)
# 7. because it uses symlink to keep update, you just need to run this scipt once
# 8. now, you have a pre-commit hook in your local repo, which will run static analysis
#    before each of your commit
# 9. enjoy!

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
