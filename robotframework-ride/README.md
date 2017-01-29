# Robotframework RIDE GUI and Server

Run the Robotframework Ride X app accessible in a web browser


## Install (like Ubuntu, Synology 6.0 DSM, etc.):

On other platforms, you can run this docker with the following command:

```
docker run -d --name="Ride" -e WIDTH="1280" -e HEIGHT="720" -v $(pwd)/config:/config:rw -v $(pwd)/robot:/robot -p XXXX:8080  ivonet/robotframework-ride
```

### Setup Instructions
- Replace the variable "$(pwd)/config" with your choice of folder on your system. That is where the config and the library files will reside, and they will survive an update, re installation, etc. of the container.
- Replace the variable "$(pwd)/robot" with your choice of folder where you can store your testcases locally on your system. That is where the config and the library files will reside, and they will survive an update, re installation, etc. of the container.
- Change "XXXX" to a port of your choice, it will be the port for the main Ride GUI
- If you would like to have the latest updates, change the EDGE variable to "1", and the container will update calibre to the latest version every time it is restarted
- If you'd like to change the resolution for the GUI, you can modify the WIDTH and HEIGHT variables

You can access the GUI by pointing your web browser to http://SERVERIP:XXXX/#/client/c/Ride

You can access the Calibre webserver by pointing your web browser to http://SERVERIP:YYYY

Replace SERVERIP, XXXX with your values. 
SERVERIP is mostly localhost on docker native and `docker-machine ip default` if still with virtualbox

