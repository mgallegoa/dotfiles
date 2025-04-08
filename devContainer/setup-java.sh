#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"
declare -x PATH_INSTALL_OPT="/opt/manuel"
export SDKMAN_DIR="$PATH_INSTALL_OPT/sdkman"

echo "*** JAVA : SDKMan, downloading installer in $SDKMAN_DIR." | tee -a $HOME/setup.log
curl -s "https://get.sdkman.io" | bash
source "$SDKMAN_DIR/bin/sdkman-init.sh"

echo "*** JAVA : SDKMan, Custon configuration finished." | tee -a $HOME/setup.log
