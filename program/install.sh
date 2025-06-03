#!/bin/bash

# ====== Colors ======
NC='\033[0m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'

echo -e "${CYAN}TERMINAI Installer${NC}"
echo "------------------------------------------"

# Check dependencies
if ! command -v curl &> /dev/null; then
  echo -e "${RED}Error: curl is not installed.${NC}"
  echo -e "${YELLOW}Please install curl and try again.${NC}"
  exit 1
fi

if ! command -v jq &> /dev/null; then
  echo -e "${YELLOW}Installing required dependency: jq${NC}"
  sudo apt update && sudo apt install -y jq
fi

# Download Terminai.sh from GitHub
echo -e "${CYAN}Downloading TERMINAI...${NC}"
curl -sSLo terminai.sh https://raw.githubusercontent.com/ZAYUVALYA/ZAYUVALYA.github.io/main/program/Terminai.sh

# Make executable
chmod +x terminai.sh

# Move to bin
sudo mv terminai.sh /usr/local/bin/terminai

echo -e "${GREEN}Installation complete!${NC}"
echo -e "You can now start TERMINAI by typing: ${YELLOW}terminai${NC}"
