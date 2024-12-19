#!/bin/sh
echo "Starting initial script..."
echo "pwd: $(pwd)"
echo "whoami: $(whoami)"

cat << End >> ~/.profile
echo "Running my ~/.profile..."
SECRET_TOKEN=abc123!@#
export SECRET_TOKEN
End

source ~/.profile
echo "$@"
echo "Finishing initial script..."
