#!/bin/bash

used=$(df -h / | awk 'NR==2 {print $3}')
total=$(df -h / | awk 'NR==2 {print $2}')
percent=$(df -h / | awk 'NR==2 {print $5}')
echo "{\"format\": \" $used/$total ($percent)\", \"tooltip-format\": \"Disk usage for /\"}"
