#!/bin/sh
echo "Starting initial script..."
echo "pwd: $(pwd)"
echo "whoami: $(whoami)"
PROFILE_PATH="/home/$(whoami)/.profile"
echo "PROFILE_PATH: $PROFILE_PATH"

cat << End >> $PROFILE_PATH
echo "Running my $PROFILE_PATH..."
SECRET_TOKEN=abc123!@#
export SECRET_TOKEN
End

echo "Loading profile..."
source $PROFILE_PATH
. $PROFILE_PATH
echo "Profile loaded!"
echo "env SECRET_TOKEN: $(printenv SECRET_TOKEN)"

echo "command: $@"
echo "Finishing initial script..."
