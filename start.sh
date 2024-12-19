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

source $PROFILE_PATH
echo "$@"
echo "Finishing initial script..."
