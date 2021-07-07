## This script can be used to get third most CPU and Memory consuming process.
This is script output to output file with the following properties
- Process Name 
- % CPU  used 
- % Memory used  
- PORT 
- PID

## Prerequisites
- This script is built for UNIX and was tested on Ubuntu. It uses bash shell. This won't work on MAC OS as flags for commands are different in MAC.
- These commands should be present on your system before running the script - lsof, ps, sed, cut and awk

## How to run this script
- Its pretty simple to run this script. Below commands will help
```
chmod +x process-details.sh
./process-details.sh
```