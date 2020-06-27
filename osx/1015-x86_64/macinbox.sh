#!/bin/bash -el

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

rm -rf ${DIR}/build
mkdir -p ${DIR}/build
cd ${DIR}/build

git clone git@github.com:corpnewt/gibMacOS.git
cd gibMacOS
git checkout 7a17c3fc117817462f615b34126af8c2e291cfca

echo -ne '\n' | ./gibMacOS.command -v 10.15

echo -ne '"macOS Downloads/publicrelease/001-15219 - 10.15.5 macOS Catalina"\n\nq\n' | ./BuildmacOSInstallApp.command

vagrant box remove macinbox --all || true

sudo -E bundle exec macinbox \
  --verbose --debug --box-format parallels \
  --installer "macOS Downloads/publicrelease/001-15219 - 10.15.5 macOS Catalina/Install macOS Catalina.app"
