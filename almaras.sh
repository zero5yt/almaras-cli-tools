#!/bin/bash

# Kulay
CYAN='\033[1;36m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

# Logo (Umiilaw effect)
echo -e "${CYAN}========================================"
echo -e "      WELCOME TO ALMARAS TOOLS"
echo -e "========================================${NC}"

# Menu
echo -e "${GREEN}[1]${NC} Install Cut Scene Tool"
echo -e "${GREEN}[2]${NC} Install MKV to MP4 Converter"
echo -e "${RED}[0]${NC} Exit"
echo ""

read -p "Pili ka ng number (1-2): " choice

case $choice in
    1)
        echo "Installing Cut Scene Tools..."
        pip install scenedetect
        echo "Done!"
        ;;
    2)
        echo "Installing MKV to MP4 Converter..."
        pkg install ffmpeg -y
        echo "Done! Gamitin ang command: ffmpeg -i input.mkv -c copy output.mp4"
        ;;
    0)
        exit
        ;;
    *)
        echo "Invalid option!"
        ;;
esac
