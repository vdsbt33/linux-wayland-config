#!/bin/bash

uptime_formatted=$(uptime | cut -d ',' -f1 | cut -d ' ' -f4,5)

date_formatted=$(date "+%d/%m/%Y")
time_formatted=$(date "+%H:%M")

output_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Eo '[0-9]{1,3}\%' | head -1)
output_icon="\uf028" # normal
if [[ $(pactl get-sink-mute @DEFAULT_SINK@) =~ "yes" ]]; then
	output_icon="\ueb24" # muted
fi

input_volume=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -Eo '[0-9]{1,3}%' | head -1)
input_icon="\uf130" # normal
if [[ $(pactl get-source-mute @DEFAULT_SOURCE@) =~ "yes" ]]; then
	input_icon="\uf131" # muted
fi

echo -e "$uptime_formatted \ueb2d   $output_volume $output_icon   $input_volume $input_icon   $date_formatted \ueab0   $time_formatted \ue382 "
