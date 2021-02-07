#!/bin/bash

source $HOME/.cache/wal/colors.sh

tmp_weather="/tmp/weather"
tmp_weather_stat=$tmp_weather/weather-stat
tmp_weather_degree=$tmp_weather/weather-degree
tmp_weather_hex=$tmp_weather/weather-hex
tmp_weather_icon=$tmp_weather/weather-icon

if [ ! -d $tmp_weather ]; then
  mkdir -p $tmp_weather
fi

KEY=""
ID="5913490"
UNIT="metric" # Options are 'metric' and 'imperial'
weather=$(curl -sf "http://api.openweathermap.org/data/2.5/weather?APPID="$KEY"&id="$ID"&units="$UNIT"")
if [ ! -z "$weather" ]; then
  weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
  weather_icon_code=$(echo "$weather" | jq -r ".weather[].icon" | head -1)
	weather_description=$(echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g")

	if [ "$weather_icon_code" == "50d"  ]; then
		weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "50n"  ]; then
    weather_icon=""
    weather_hex=$color2
	elif [ "$weather_icon_code" == "01d"  ]; then
    weather_icon=""
    weather_hex=$color3
  elif [ "$weather_icon_code" == "01n"  ]; then
    weather_icon=""
    weather_hex=$color4
  elif [ "$weather_icon_code" == "02d"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "02n"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "03d"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "03n"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "04d"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "04n"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "09d"  ]; then
    weather_icon=""
    weather_hex=$color5
  elif [ "$weather_icon_code" == "09n"  ]; then
    weather_icon=""
    weather_hex=$color5
  elif [ "$weather_icon_code" == "10d"  ]; then
    weather_icon=""
    weather_hex=$color5
  elif [ "$weather_icon_code" == "10n"  ]; then
    weather_icon=""
    weather_hex=$color5
  elif [ "$weather_icon_code" == "11d"  ]; then
    weather_icon=""
    weather_hex=$color6
  elif [ "$weather_icon_code" == "11n"  ]; then
    weather_icon=""
    weather_hex=$color6
  elif [ "$weather_icon_code" == "13d"  ]; then
    weather_icon=""
    weather_hex=$color7
  elif [ "$weather_icon_code" == "13n"  ]; then
    weather_icon=""
    weather_hex=$color7
  elif [ "$weather_icon_code" == "40d"  ]; then
    weather_icon=""
    weather_hex=$color2
  elif [ "$weather_icon_code" == "40n"  ]; then
    weather_icon=""
    weather_hex=$color2
  else 
    weather_icon=""
    weather_hex=$color2
  fi

  echo "$weather_icon" >  $tmp_weather_icon
  echo "$weather_description" > $tmp_weather_stat
  echo "$weather_temp""°C" > $tmp_weather_degree
  echo "$weather_hex" > $tmp_weather_hex
else
  echo "Weather Unavailable" > $tmp_weather_stat
  echo "" > $tmp_weather_icon
  echo "-" > $tmp_weather_degree
  echo "#adadff" > $tmp_weather_hex
fi
