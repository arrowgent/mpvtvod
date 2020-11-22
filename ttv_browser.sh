#!/bin/sh
# "https://www.twitch.tv/embed/$channel1/chat?parent=twitch.com" "https://player.twitch.tv/?channel=$channel1&html5=true&parent=twitch.com&player_type=embed&playlist_sequence=-1"
# open (C) pop out embedded chat with NO ADS player, (L) using your credentials for chat & player to get channel points -- WITH ads (V) vivaldi another browser
# --new-window has troubles starting a new PID, it works 50/50 if you already have existing previous session... WIP

channel1=$1

while true; do
    read -p "open twitch stream as: (C) chromium anon (L) chromium logged-in (V) vivaldi anon (Q) to exit > " clv
    case $clv in
        [Cc]* ) chromium-browser --new-window|sleep 4s|chromium-browser --new-window "https://www.twitch.tv/embed/$channel1/chat?parent=twitch.com" "https://twitchls.com/$channel1";;
        [Ll]* ) chromium-browser --new-window|sleep 4s|chromium-browser --new-window "https://www.twitch.tv/embed/$channel1/chat?parent=twitch.com" "https://player.twitch.tv/?channel=$channel1&html5=true&parent=twitch.com&player_type=embed&playlist_sequence=-1";;
        [Vv]* ) vivaldi --new-window|sleep 4s|vivaldi --new-window "https://www.twitch.tv/embed/$channel1/chat?parent=twitch.com" "https://twitchls.com/$channel1";;
        * ) exit;;
    esac
done
