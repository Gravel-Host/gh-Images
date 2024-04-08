#!/bin/bash
cd /home/container || exit 1

# Configure colors
YELLOW='\033[0;33m' 
RESET_COLOR='\033[0m'

# Print Current Java Version
java -version

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "${YELLOW}STARTUP /home/container: ${MODIFIED_STARTUP} ${RESET_COLOR}"

# Run the Server
# shellcheck disable=SC2086
echo "Welcome to Gravel Host! If you have any issues please contact us on our discord."
echo "discord.gg/gravelhost"
eval ${MODIFIED_STARTUP}


