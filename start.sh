#!/bin/sh
echo "Starting initial script..."
cat << End >> ~/.profile
export SECRET_TOKEN=abc123!@#
End
exec "$@"
echo "Finishing initial script..."
