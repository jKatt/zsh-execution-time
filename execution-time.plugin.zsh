function preexec() {
  timer=$(gdate +%s%3N)
}
function precmd() {
  dateString=$(gdate +"%a %b %d %T %Y")
  if [[ $timer ]]; then
    now=$(gdate +%s%3N)
    elapsed=$(($now-$timer))
    elapsedHours=""
    unit="ms"
    color=240
    if [[ $elapsed -ge 3600000 ]]; then
      hours=$(($elapsed / 3600000))
      elapsedHours="${hours}h "
    fi
    if [[ $elapsed -ge 60000 ]]; then
      elapsed=$((($elapsed / 60000) % 60))
      unit="m"
      color="red"
    elif [[ $elapsed -ge 3000 ]]; then
      elapsed=$(($elapsed / 1000))
      unit="s"
    fi
    export RPROMPT="%F{${color}}${elapsedHours}${elapsed}${unit}%F{240} < ${dateString}%f"
    unset timer
  else
    export RPROMPT="%F{240}${dateString}%f"
  fi
}
