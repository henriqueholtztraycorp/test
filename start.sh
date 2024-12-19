#!/bin/sh
echo "Starting initial script..."
pwd
whoami
cat << End >> /home/app/.profile

echo "Running my /home/app/.profile..."
SECRET_TOKEN=abc123!@#
export SECRET_TOKEN
End
echo "$@"
echo "Finishing initial script..."
