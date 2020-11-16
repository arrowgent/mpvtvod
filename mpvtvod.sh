#! /bin/sh
# mpv twitch VOD with quality setting using streamlink
#example: mpvtvod username

#colors
NC='\033[0m'
RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[0;33m'
BLUE='\033[0;34m'

name1=$1
name2="$2"
#if quality empty then set to best (see if statement)
#name2e=${name2:="best"}
name3=$(twitch-dl videos $name1 --limit 1|grep -m 1 -o 'https://www.twitch.tv/videos/.*')

#show last vod (limit 1 only)
echo ${YEL}twitch-dl videos $name1 --limit 1${NC};twitch-dl videos $name1 --limit 1

#show quality options
echo ${BLUE}vod url= $name3${NC}
echo ${GRN}streamlink --player-passthrough hls --player mpv $name3 ${GRN}quality${NC}
echo ${YEL}youtube-dl -F $name3;youtube-dl -F $name3${NC}

#query quality
read -p "set quality audio, 360p, 480p, 720p, best, etc > " name2;

#option quality or source or quit
while true; do
    read -p "set $name1 quality $name2? N for Source, A for audio, L for live, Q to exit > " ynla
    case $ynla in
        [Yy]* ) if [ "$name2" = "" ]; then
                    echo ${RED}"quality is not set - set quality to best"${NC}; \
                    name2e=${name2:="best"}
                fi
                echo ${GRN}streamlink --player-passthrough hls --player mpv $name3 $name2${NC}; \
                streamlink --player-passthrough hls --player mpv $name3 $name2;;
        [Nn]* ) echo ${GRN}streamlink --player-passthrough hls --player mpv $name3 best${NC};   \
                streamlink --player-passthrough hls --player mpv $name3 best;;
        [Ll]* ) if [ "$name2" = "" ]; then
                    echo ${RED}"quality is not set - set quality to best"${NC}; \
                    name2e=${name2:="best"}
                fi
                echo ${YEL}youtube-dl -F https://www.twitch.tv/$name1${NC};youtube-dl -F https://www.twitch.tv/$name1; \
                echo ${GRN}streamlink --player-passthrough hls --player mpv https://www.twitch.tv/$name1$ $name2${NC};   \
                streamlink --player-passthrough hls --player mpv https://www.twitch.tv/$name1 $name2;;
        [Aa]* ) echo ${GRN}streamlink --player-passthrough hls --player mpv $name3 audio${NC};  \
                streamlink --player-passthrough hls --player mpv $name3 audio;;
        * ) exit;;
    esac
done
