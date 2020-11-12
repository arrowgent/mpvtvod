#! /bin/sh
# mpv twitch with quality setting mpv only

name1=$1
name2=$2
name3=$3

#example: mpvtw username

#show quality options
echo youtube-dl -F https://www.twitch.tv/$1;youtube-dl -F https://www.twitch.tv/$1

#query quality
read -p "set quality 360p, 480p, 720p, etc > " name2;

#option quality or source or quit
while true; do
    read -p "set $name1 quality $name2'p'? N for Source, A for audio, Q to exit > " yna
    case $yna in
        [Yy]* ) echo mpv https://www.twitch.tv/$1 --ytdl-format=$name2'p';mpv https://www.twitch.tv/$1 --ytdl-format=$name2'p';;
        [Nn]* ) echo mpv https://www.twitch.tv/$1;mpv https://www.twitch.tv/$1;;
        [Aa]* ) echo mpv https://www.twitch.tv/$1 audio;mpv https://www.twitch.tv/$1 --ytdl-format=audio_only;;
        * ) exit;;
    esac
done
