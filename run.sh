#!/bin/sh

cat <<EOF >/etc/motd
------------------------
My super light OS. Easy to update.
Hostname: $(hostname)
------------------------
EOF

schedule_reboot() {
  # Format is "YYYY-MM-DD HH:MM:SS"
  datetime=$1

  # Convert input to epoch time
  epoch_time=$(date -d "$datetime" +%s)

  # Current epoch time
  current_time=$(date +%s)

  # Calculate time difference in seconds
  time_diff=$((epoch_time - current_time))

  # Check if the provided time is in the past
  if [ $time_diff -le 0 ]; then
    echo "Provided time is in the past. Please provide a future time."
    return
  fi

  # Schedule shutdown
  echo "Shutting down at: $datetime"
  shutdown -h +$(($time_diff / 60))
}

schedule_reboot "2024-02-23 19:05:00"
