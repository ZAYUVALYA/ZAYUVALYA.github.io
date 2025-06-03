#!/bin/bash

# ====== Colors ======
NC='\033[0m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
GRAY='\033[1;30m'

# ====== Get username ======
USERNAME=$(whoami)

# ====== Welcome Banner ======
echo -e "${CYAN}"
echo "╔════════════════════════════════════════════════════╗"
echo "║                  Welcome to TERMINAI              ║"
echo "║       Your personal AI chat in the terminal       ║"
echo "║     Type your question and get instant answers     ║"
echo "║           Type 'exit' to leave the chat              ║"
echo "╠════════════════════════════════════════════════════╣"
echo "║  Made by ZAYUVALYA:   https://zayuvalya.github.io  ║"
echo "║  Powered by POLLINATIONS AI:                       ║"
echo "║     https://github.com/pollinations/pollinations   ║"
echo "╚════════════════════════════════════════════════════╝"
echo -e "${NC}"

# ====== Chat Loop ======
while true; do
  echo -ne "${CYAN}${USERNAME} > ${NC}"
  read input
  if [[ "$input" == "exit" ]]; then
    echo -e "${YELLOW}Goodbye from TERMINAI!${NC}"
    break
  fi

  timestamp=$(date "+%H:%M:%S")
  encoded_input=$(echo "$input" | jq -sRr @uri)

  echo -e "${GRAY}[${timestamp}] Contacting AI...${NC}"
  start_time=$(date +%s.%N)

  response=$(curl -s "https://text.pollinations.ai/prompt/${encoded_input}")

  end_time=$(date +%s.%N)
  duration=$(echo "$end_time - $start_time" | bc)

  echo -e "${GREEN}TERMINAI > $response${NC}"
  echo -e "${GRAY}[Response time: ${duration}s]${NC}\n"
done
