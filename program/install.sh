#!/bin/bash

echo -e "\033[1;36mInstalling ZAYUVALYA Terminal AI Chat...\033[0m"

# Step 1: Check & install jq
if ! command -v jq &> /dev/null; then
  echo -e "\033[1;33mInstalling dependency: jq...\033[0m"
  sudo apt update && sudo apt install -y jq
fi

# Step 2: Download the zayuvalya script
echo -e "\033[1;33mDownloading ZAYUVALYA script...\033[0m"
wget -q https://raw.githubusercontent.com/ZAYUVALYA/ZAYUVALYA.github.io/main/program/zayuvalya -O ~/zayuvalya

# Step 3: Make it executable
chmod +x ~/zayuvalya

# Step 4: Move to /usr/local/bin
sudo mv ~/zayuvalya /usr/local/bin/zayuvalya

# Step 5: Done
echo -e "\033[1;32mZAYUVALYA AI Chat has been installed!\033[0m"
echo -e "\n\033[1;36mYou can now type '\033[1;33mzayuvalya\033[1;36m' in your terminal to start chatting with AI!\033[0m"
