#!/bin/sh
# Update all straight.el packages and regenerate the lockfile.
# Usage: sh script/update_packages.sh

set -e

cd "$(dirname "$0")/.."

# Scope the accelerator to this script and its Emacs child process only.
GH_PROXY_URL="${GH_PROXY_URL:-https://gh-proxy.com/https://github.com/}"
GIT_PROXY_INDEX="${GIT_CONFIG_COUNT:-0}"
export GIT_CONFIG_COUNT="$(( GIT_PROXY_INDEX + 1 ))"
export "GIT_CONFIG_KEY_${GIT_PROXY_INDEX}=url.${GH_PROXY_URL}.insteadOf"
export "GIT_CONFIG_VALUE_${GIT_PROXY_INDEX}=https://github.com/"

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
