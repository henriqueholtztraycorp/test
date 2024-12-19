#!/bin/sh
echo "Starting initial script..."
echo "pwd: $(pwd)"
echo "whoami: $(whoami)"
cat << End >> /home/app/.profile

echo "Running my /home/app/.profile..."
SECRET_TOKEN=abc123!@#
export SECRET_TOKEN
End
echo "$@"
echo "Finishing initial script..."
