#! /bin/sh
# mpv twitch VOD with quality setting using streamlink

#colors
NC='\033[0m'
RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[0;33m'
BLUE='\033[0;34m'

name1=$1
name2=$2
name3=$(twitch-dl videos $name1 --limit 1|grep -m 1 -o 'https://www.twitch.tv/videos/.*')

#example: mpvtvod username
#show last vod (limit 1 only)
twitch-dl videos $name1 --limit 1

#show quality options
echo -e ${BLUE}vod url= $name3${NC}
echo -e ${RED}streamlink --player-passthrough hls --player mpv $name3 ${RED}quality${NC}
echo -e ${YEL}youtube-dl -F $name3;youtube-dl -F $name3${NC}

#query quality
read -p "set quality audio, 360p, 480p, 720p, best, etc > " name2;

#option quality or source or quit
while true; do
    read -p "set $name1 quality $name2? N for Source, A for audio, Q to exit > " yna
    case $yna in
        [Yy]* ) echo -e ${GRN}streamlink --player-passthrough hls --player mpv $name3 $name2${NC};streamlink --player-passthrough hls --player mpv $name3 $name2;;
        [Nn]* ) echo -e ${GRN}streamlink --player-passthrough hls --player mpv $name3 best${NC};streamlink --player-passthrough hls --player mpv $name3 best;;
        [Aa]* ) echo -e ${GRN}streamlink --player-passthrough hls --player mpv $name3 audio${NC};streamlink --player-passthrough hls --player mpv $name3 audio;;
        * ) exit;;
    esac
done
