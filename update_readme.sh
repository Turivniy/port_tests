#!/bin/bash

PACKAGE=$1
MAIN_DIR=/home/fedora/sturivny/public_git/test_updates/$PACKAGE

git clone https://upstreamfirst.fedorainfracloud.org/${PACKAGE}.git

echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"NAVIGATE TO MAIN DIR"
cd $MAIN_DIR

echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"CREATE BRANCH: upd_readme"
git checkout -b upd_readme


echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"NAVIGATE TO MAIN DIR"
cd $MAIN_DIR

echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"CREATE README"
cat << EOF > $MAIN_DIR/README.rst
Test has been migrated to dist-git https://src.fedoraproject.org/rpms/${PACKAGE}/pull-request/1
EOF

echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"CREATE SYMLINK"
cd $MAIN_DIR

ln -s README.rst MIGRATED

echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"GIT ADD"
cd $MAIN_DIR
git add *

git config --global user.name "Serhii Turivnyi"
git config --global user.email sturivny@redhat.com

echo '::[ '`date '+%Y-%m-%d %H:%M:%S'`' ] '"GIT COMMIT"
cd $MAIN_DIR
git commit -m "Update README file. Migrated tests to dist-git"

cd /home/fedora/sturivny/public_git/test_updates/

