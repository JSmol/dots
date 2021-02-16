################################################################################
#                fish shell configuration and helper functions.                #
################################################################################
#                /TODO if you're bored.                                        #
################################################################################

################################################################################
# screen layout shortcuts
# TODO:
# - laptop and monitor toggle
################################################################################
function toggle-monitor
  # dont know how to do this yet...
end

################################################################################
# theme and widget functions
# TODO:
################################################################################

function toggle-center
  if $centeropen
    eww close wal
    eww close wal-colors
    eww close blur-full
    set -U centeropen false
  else
    eww open-many blur-full wal wal-colors
    set -U centeropen true
  end
end

function toggle-widgets
  if $widgetsopen
    eww close weather
    eww close music
    set -U widgetsopen false
  else
    eww open weather
    eww open music
    set -U widgetsopen true
  end
end

function eww-reset
  eww close-all
  eww kill
  eww daemon
end

function theme-reset
  sh $HOME/.config/misc/colors.sh
  sh $HOME/.config/misc/dunst.sh
  pywalfox update
  set -U widgetsopen false
  set -U centeropen false
  eww-reset
end

function wal-random
  wal -i $HOME/images/vibes
  theme-reset
end

function wal-image
  wal -i $argv[1]
  reset-theme
end

################################################################################
# SPOTIFY FUNCTIONS
# TODO: 
# - Checks for no music playing
################################################################################

function spotify-song
  set song (playerctl metadata -p spotify -f "{{artist}} - {{title}}")
  set str (string join "" "   " $song)
  set len (string length $str)
  if [ $len -gt 25 ]
    set str (string join "" $str $str)
    set sec (date +"%s")
    set offset (math $sec % $len + 1)
    echo (string sub -s $offset -l 28 $str)
  else
    echo $str
  end
end

function spotify-image
  set imgdir /tmp/spotify
  if [ ! -d $imgdir ]
    mkdir $imgdir
  end
  set imgid (playerctl metadata -p spotify mpris:trackid)
  if test ! -f "$imgdir/$imgid"
    set imgurl (playerctl metadata -p spotify mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')
    curl -s "$imgurl" --output "$imgdir/$imgid"
  end
  echo $imgdir/$imgid 
end

function spotify-button
  if [ (playerctl -p spotify status) = "Playing" ]
    echo ""
  else
    echo ""
  end
end

################################################################################
# youtube-dl shortcuts ?
# TODO: (maybe this will be better done with abbr)
# - youtube-audio
# - youtube-video
# - crunchyroll-anime
################################################################################

################################################################################
# docker???
################################################################################

function dbr # build & run
  docker run -i (docker build -q .)
end

################################################################################
# ON LOGIN
################################################################################

starship init fish | source

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx
  end
end
