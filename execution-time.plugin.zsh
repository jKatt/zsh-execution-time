function preexec() {
  timer=$(gdate +%s%3N)
}
function precmd() {
  dateString=$(gdate +%c)
  if [ $timer ]; then
    now=$(gdate +%s%3N)
    elapsed=$(($now-$timer))
    unit="ms"
    color=240
    if [ $elapsed -ge 1000 ]; then
      elapsed=$(($elapsed/1000))
      unit="s"
    fi
    if [ $elapsed -ge 60 ]; then
      elapsed=$(($elapsed/60))
      unit="m"
      color="red"
    fi
    export RPROMPT="%F{${color}}${elapsed}${unit}%F{240} < ${dateString}%f"
    unset timer
  else
    export RPROMPT="%F{240}${dateString}%f"
  fi
}