## Script can be used to get third most CPU and Memory consuming process.
Script writes output to the output file with the following properties:-
- Process Name 
- % CPU  used 
- % Memory used  
- PORT
- PID

## Prerequisites
- This script is built for UNIX and was tested on Ubuntu. It uses bash shell. This won't work on MAC OS as flags for commands are different in MAC.
- These commands should be present on your system before running the script - lsof, ps, sed, cut and awk

## How to run this script
```
chmod +x process-details.sh
./process-details.sh
```

## How to check output
- This script creates a file in which output is stored. File name is - ```process-details.txt```.
- This file wil be created in same folder where you are running your script
- Sharing screenshot of a sample output
<img width="535" alt="Screenshot 2021-07-08 at 10 20 49 AM" src="https://user-images.githubusercontent.com/56301121/124864224-2dd71d80-dfd6-11eb-839b-13374c812650.png">
