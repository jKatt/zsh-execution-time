zmodload zsh/datetime

function sliced_epoch_nanoseconds {
  local now=$(strftime "%s%N")
  echo ${now:0:-6}
}

function preexec() {
  execution_start_time=$(sliced_epoch_nanoseconds)
}

function precmd() {
  local dateString=$(strftime "%Y-%m-%d %T")
  if [[ $execution_start_time ]]; then
    local now=$(sliced_epoch_nanoseconds)
    local elapsed=$(($now-$execution_start_time))
    local elapsedHours=""
    local unit="ms"
    local color=240
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
    unset execution_start_time
  else
    export RPROMPT="%F{240}${dateString}%f"
  fi
}
