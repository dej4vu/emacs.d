#!/bin/sh
# Update all straight.el packages and regenerate the lockfile.
# Usage: sh script/update_packages.sh

set -e

cd "$(dirname "$0")/.."

echo "==> Pulling latest package versions..."
emacs --batch -l lisp/init-straight.el \
      --eval '(progn
                (straight-pull-all)
                (straight-rebuild-all)
                (straight-freeze-versions t)
                (message "Packages updated, lockfile regenerated."))'

echo "==> Verifying startup..."
./test-startup.sh

echo "==> Done. Review straight/versions/default.el before committing."
