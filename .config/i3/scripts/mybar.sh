echo '{ "version": 1, "click_events":true }'
echo '['
echo '[]'

# launched in a background process
(while :;
do
  echo -n ",["
  echo -n "{\"name\":\"id_cpu\",\"background\":\"#283593\",\"full_text\":\"$(/home/your-name/.config/i3status/cpu.py)%\"},"
  echo -n "{\"name\":\"id_time\",\"background\":\"#546E7A\",\"full_text\":\"$(date)\"}"
  echo -n "]"
  sleep 1
done) &

# Listening for STDIN events
while read line;
do
  # echo $line > /tmp/tmp.txt
  # on click, we get from STDIN :
  # {"name":"id_time","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # DATE click
  if [[ $line == *"name"*"id_time"* ]]; then
    alacritty -e /home/your-name/.config/i3status/click_time.sh &

  # CPU click
  elif [[ $line == *"name"*"id_cpu"* ]]; then
    alacritty -e htop &
  fi
done
