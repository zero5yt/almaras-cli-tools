#!/bin/bash

# ANSI Color Codes para sa "Ilaw-ilaw" (Blink) at Bolding
BLINK='\033[5m'
BOLD='\033[1m'
CYAN='\033[36m'
GREEN='\033[32m'
RED='\033[31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color (Reset)

# Header na Umiilaw
clear
echo -e "${CYAN}${BOLD}${BLINK}========================================"
echo -e "      ALMARAS CLI TOOLS - PRO MENU      "
echo -e "========================================${NC}"
echo ""
echo -e "${YELLOW}Pumili ka ng gagawin:${NC}"
echo -e "${GREEN}[1]${NC} Cut Scene Tool (Auto-Reels)"
echo -e "${GREEN}[2]${NC} MKV to MP4 Converter (Super Fast)"
echo -e "${RED}[0]${NC} Exit"
echo ""

read -p "Pili ka ng number (0-2): " choice

case $choice in
    1)
        echo -e "${CYAN}Sige boss, paki-type yung path ng video (hal. /sdcard/Download/movie.mp4):${NC}"
        read -p "Path: " videopath
        ./autoreels.sh "$videopath"
        ;;
    2)
        echo -e "${CYAN}Sige boss, paki-type yung path ng MKV (hal. /sdcard/Download/movie.mkv):${NC}"
        read -p "Path: " inputfile
        outputfile="${inputfile%.*}.mp4"
        echo -e "${YELLOW}Converting... please wait, boss!${NC}"
        ffmpeg -i "$inputfile" -c copy "$outputfile"
        echo -e "${GREEN}${BOLD}Done! Na-save sa: $outputfile${NC}"
        ;;
    0)
        echo "Bye bye boss!"
        exit
        ;;
    *)
        echo -e "${RED}Invalid option, boss!${NC}"
        ;;
esac
