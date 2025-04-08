#!/bin/bash

# e: Exit script on any error. u: treat unset variables as error. o Fail
set -euo pipefail

declare -x PATH_DOTFILES="$HOME/dotfiles"
declare -x PATH_INSTALL_OPT="/opt/manuel"
export SDKMAN_DIR="$PATH_INSTALL_OPT/sdkman"

echo "*** JAVA : SDKMan, downloading installer in $SDKMAN_DIR." | tee -a $HOME/setup.log
curl -s "https://get.sdkman.io" | bash

echo "JAVA : SDKMan, source to $SDKMAN_DIR." | tee -a $HOME/setup.log
export SDKMAN_DIR="/opt/manuel/sdkman"
 [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

echo "JAVA : SDKMan, Installing OpenJdk java 21.0.6-tem usin the SDKMan." | tee -a $HOME/setup.log
sdk install java 21.0.6-tem

echo "*** JAVA : SDKMan, Custon configuration finished." | tee -a $HOME/setup.log
