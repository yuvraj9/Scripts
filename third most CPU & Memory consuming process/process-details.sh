#! /bin/bash

# Getting process with 3rd highest Memory usage
MEMORY_OUTPUT=$(ps -eo pid,%mem,%cpu,cmd --sort=-%mem | sed -n '4 p')

# Getting individual attributes and assigning variables to them
PID_MEMORY=$(echo $MEMORY_OUTPUT | awk '{print $1}')
MEMORY_USAGE_MEMORY=$(echo $MEMORY_OUTPUT | awk '{print $2}')
CPU_USAGE_MEMORY=$(echo $MEMORY_OUTPUT | awk '{print $3}')
COMMAND_MEMORY=$(echo $MEMORY_OUTPUT | cut -d" "  -f4-)
PORT_MEMORY=$(lsof -Pan -p $PID_MEMORY -i | awk '{print $9}' | sed -n '2 p')
# Putting the details in a file
echo "Details of process which has 3rd highest memory usage - PID - $PID_MEMORY, Memory Usage - $MEMORY_USAGE_MEMORY, CPU Usage - $CPU_USAGE_MEMORY, Command/Name - $COMMAND_MEMORY, Port - $PORT_MEMORY" > process-details.txt

# Getting process with 3rd highest CPU usage
CPU_OUTPUT=$(ps -eo pid,%mem,%cpu,cmd --sort=-%cpu | sed -n '4 p')

# Getting individual attributes and assigning variables to them
PID_CPU=$(echo $CPU_OUTPUT | awk '{print $1}')
MEMORY_USAGE_CPU=$(echo $CPU_OUTPUT | awk '{print $2}')
CPU_USAGE_CPU=$(echo $CPU_OUTPUT | awk '{print $3}')
COMMAND_CPU=$(echo $CPU_OUTPUT | cut -d" "  -f4-)
PORT_CPU=$(lsof -Pan -p $PID_CPU -i | awk '{print $9}' | sed -n '2 p')
# Putting the details in a file
echo "Details of process which has 3rd highest CPU usage - PID - $PID_CPU, Memory Usage - $MEMORY_USAGE_CPU, CPU Usage - $CPU_USAGE_CPU, Command/Name - $COMMAND_CPU, Port - $PORT_CPU" >> process-details.txt

