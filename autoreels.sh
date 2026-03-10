#!/bin/bash

# ====================================================
# RODERICK V. ALMARAS - AUTO REELS ENGINE
# ====================================================

# ANSI Color Codes para sa "Ilaw-ilaw" at Bolding
BLINK='\033[5m'
BOLD='\033[1m'
CYAN='\033[36m'
GREEN='\033[32m'
RED='\033[31m'
NC='\033[0m' # No Color (Reset)

# Header na umiilaw
echo -e "${CYAN}${BOLD}${BLINK}========================================"
echo -e "   RODERICK V. ALMARAS - REELS ENGINE   "
echo -e "========================================${NC}"

# Check kung may naipasa na video file
if [ -z "$1" ]; then
    echo -e "${RED}Error: Walang nailagay na file!${NC}"
    echo "Usage: ./autoreels.sh <movie.mp4>"
    exit 1
fi

movie="$1"
mkdir -p reels

echo -e "${CYAN}Analyzing scenes... please wait...${NC}"

# Python script para mag-detect at mag-crop
python3 <<PY
from scenedetect import VideoManager, SceneManager
from scenedetect.detectors import ContentDetector
import os

video='$movie'
video_manager = VideoManager([video])
scene_manager = SceneManager()
scene_manager.add_detector(ContentDetector())
video_manager.start()
scene_manager.detect_scenes(frame_source=video_manager)
scenes = scene_manager.get_scene_list()

count = 1
# Limitahan sa 5 scenes para test
for start, end in scenes[:5]:
    s = start.get_seconds()
    e = end.get_seconds()
    duration = min(30, e - s) # Max 30 seconds per clip
    
    clip = f"reels/clip{count:02d}.mp4"
    
    # FFmpeg command: scale and crop to 9:16
    cmd = f'ffmpeg -y -i "{video}" -ss {s} -t {duration} -vf "scale=-1:1920,crop=1080:1920" -c:v libx264 -crf 23 -preset ultrafast "{clip}"'
    
    print(f"Processing clip {count}...")
    os.system(cmd)
    count += 1

video_manager.release()
PY

# Success message na umiilaw
echo -e "${GREEN}${BOLD}${BLINK}Done boss! Check mo yung 'reels' folder!${NC}"
