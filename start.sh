#!/bin/sh
echo "Starting initial script..."
echo "pwd: $(pwd)"
echo "whoami: $(whoami)"
PROFILE_PATH="/home/$(whoami)/.profile"
echo "PROFILE_PATH: $PROFILE_PATH"
CLUSTER_NAME=$(curl --connect-timeout 2.0 -s ${ECS_CONTAINER_METADATA_URI_V4}/task | grep -o '"Cluster":"[^"]*"' | cut -d':' -f2 | tr -d '"')
echo "CLUSTER_NAME: $CLUSTER_NAME"

cat << End >> $PROFILE_PATH
echo "Running my $PROFILE_PATH..."
NEW_RELIC_LABELS="foo:bar;cluster:$CLUSTER_NAME"
export NEW_RELIC_LABELS
export CLUSTER_NAME
End

echo "Loading profile..."
# source $PROFILE_PATH => It doesn't work because some shell uses just "." instead of "source"
. $PROFILE_PATH
echo "Profile loaded!"
echo "env NEW_RELIC_LABELS: $(printenv NEW_RELIC_LABELS)"

echo "command: $@"

#dotnet Fbits.Static.Web.dll --environment=Staging
echo "Finishing initial script..."
