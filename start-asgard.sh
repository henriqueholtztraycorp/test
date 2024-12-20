#!/bin/sh
echo "Starting initial script..."
echo "pwd: $(pwd)"
echo "whoami: $(whoami)"
PROFILE_PATH="/home/$(whoami)/.profile"
echo "PROFILE_PATH: $PROFILE_PATH"

cat << End >> $PROFILE_PATH
echo "Running my $PROFILE_PATH..."
NEW_RELIC_LABELS="foo:bar;cluster:ms-homolog2"
SECRET_TOKEN_TEST=abc123!@#
export SECRET_TOKEN_TEST
export NEW_RELIC_LABELS
End

echo "Loading profile..."
# source $PROFILE_PATH => It doesn't work because some shell uses just "." instead of "source"
. $PROFILE_PATH
echo "Profile loaded!"
echo "env SECRET_TOKEN_TEST: $(printenv SECRET_TOKEN_TEST)"
echo "env NEW_RELIC_LABELS: $(printenv NEW_RELIC_LABELS)"

echo "command: $@"

dotnet Asgard.API.dll

echo "Finishing initial script..."
