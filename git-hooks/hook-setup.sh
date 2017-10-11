#!/bin/sh
#
# Script to set local pre-commit git-hook as a symlink to the actual pre-commit script which
# is maintained within the remote repo.

#get the dir of local hooks
GITHOOKS_DIR=$(git rev-parse --show-toplevel)/.git/hooks
#get the dir of repo hooks
REPOHOOKS_DIR=$(git rev-parse --show-toplevel)/git-hooks

# If pre-commit is already exists in local, then back it up
if [ -e "$GITHOOKS_DIR/pre-commit" ]; then
    mv $GITHOOKS_DIR/pre-commit $GITHOOKS_DIR/pre-commit.old
fi

#symlink local hooks to repo actual hooks
ln -s -f $REPOHOOKS_DIR/pre-commit $GITHOOKS_DIR/pre-commit
