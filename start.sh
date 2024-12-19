#!/bin/sh
echo "Starting initial script..."
cat << End >> /etc/profile
SECRET_TOKEN=abc123!@#
export SECRET_TOKEN
End
echo "$@"
echo "Finishing initial script..."
