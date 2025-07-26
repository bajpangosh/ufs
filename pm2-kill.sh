#!/bin/bash

# Ask user for port number
read -p "Enter the port number to check: " port

# Get the PID listening on the port
pid=$(sudo lsof -i TCP:$port -sTCP:LISTEN -t)

if [ -z "$pid" ]; then
  echo "âœ… Port $port is not in use."
  exit 0
fi

echo "âš ï¸ Port $port is being used by PID: $pid"

# Get all PM2-managed PIDs
pm2_pids=$(pm2 pid all)

# Check if this PID belongs to a PM2 process
if echo "$pm2_pids" | grep -wq "$pid"; then
  echo "âœ… PID $pid is managed by PM2."

  # Get PM2 app name using `pm2 jlist` and jq
  if command -v jq >/dev/null 2>&1; then
    app_name=$(pm2 jlist | jq -r ".[] | select(.pid==$pid) | .name")
  else
    echo "â— 'jq' not found. Trying fallback method to find app name."
    app_name=$(pm2 list | awk -v pid="$pid" '$0 ~ pid {print $2}')
  fi

  if [ -n "$app_name" ]; then
    echo "ðŸ” Port $port is used by PM2 app: $app_name"
    read -p "Do you want to stop the PM2 app '$app_name'? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      pm2 stop "$app_name"
      echo "âœ… PM2 app '$app_name' stopped."
    else
      echo "âŽ PM2 app was not stopped."
    fi
  else
    echo "âŒ Could not determine the PM2 app name for PID $pid."
  fi
else
  echo "âŒ PID $pid is not managed by PM2."
  ps -p "$pid" -o pid,comm,args
  read -p "Do you want to kill this process manually? (y/n): " kill_confirm
  if [[ "$kill_confirm" =~ ^[Yy]$ ]]; then
    sudo kill "$pid"
    if [ $? -eq 0 ]; then
      echo "âœ… Process $pid killed successfully."
    else
      echo "âŒ Failed to kill process $pid."
    fi
  else
    echo "âŽ Process not killed."
  fi
fi
