#! /bin/bash

resourceFunction() {

    # Defining default variable
    RESOURCE=""

    # Getting process with 3rd highest resource usage and sorting according to argument value
    OUTPUT=$(ps -eo pid,%mem,%cpu,cmd --sort=$1 | sed -n '4 p')

    # Getting individual attributes and assigning variables to them
    PID=$(echo $OUTPUT | awk '{print $1}')
    MEMORY_USAGE=$(echo $OUTPUT | awk '{print $2}')
    CPU_USAGE=$(echo $OUTPUT | awk '{print $3}')
    COMMAND=$(echo $OUTPUT | cut -d" "  -f4-)
    PORT=$(lsof -Pan -p $PID -i | awk '{print $9}' | sed -n '2 p')

    # If condition to get resource name according to argument
    if [ "$1" == "%mem" ]; then
        RESOURCE="Memory"
    else
        RESOURCE="CPU"
    fi

    DATE=$(date)

    # Making an empty file
    echo "" > process-details.txt

    # Putting the details in a file
    echo -e "$DATE \n[ Details of process which has 3rd highest $RESOURCE usage ] \nPID - $PID \nMemory Usage - $MEMORY_USAGE \nCPU Usage - $CPU_USAGE \nCommand/Name - $COMMAND \nPort - $PORT \n" >> process-details.txt
    
}

echo "[+] Running script to get PID,Memory Usage, CPU usage, Process Name and port of third most cpu and memory consuming process"
resourceFunction %mem
resourceFunction %cpu
echo "[+] You can check out the output in process-details.txt file"