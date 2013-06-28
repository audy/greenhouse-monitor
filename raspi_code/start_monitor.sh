#!/bin/bash

# run it no matter what!
while true; do
  echo "Starting Monitor!"
  ruby monitor.rb
  echo "Something went wrong with the monitor: Exit Code: $?"
  sleep 3
done
