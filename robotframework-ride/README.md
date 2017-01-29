# Robotframework RIDE IDE GUI in a browser

Run the Robotframework Ride IDE X app accessible in a web browser


## Install (like Ubuntu, Synology 6.0 DSM, etc.):

On other platforms, you can run this docker with the following command:

```
docker run -d --rm --name="robot" -e WIDTH="1280" -e HEIGHT="720" -v $(pwd)/config:/config:rw -v $(pwd)/robot:/robot -p XXXX:8080  ivonet/robotframework-ride
```

### Setup Instructions
- Replace the variable "$(pwd)/config" with your choice of folder on your system. That is where the config and the library files will reside, and they will survive an update, re installation, etc. of the container.
- Replace the variable "$(pwd)/robot" with your choice of folder where you can store your testcases locally on your system. That is where the config and the library files will reside, and they will survive an update, re installation, etc. of the container.
- Change "XXXX" to a port of your choice, it will be the port for the main Ride GUI
- If you'd like to change the resolution for the GUI, you can modify the WIDTH and HEIGHT variables

You can access the GUI by pointing your web browser to http://SERVERIP:XXXX/#/client/c/Ride

Or by going to http://SERVERIP:XXXX and selecting Ride in the gui.

Replace SERVERIP, XXXX with your values. 
SERVERIP is mostly localhost on docker native and `docker-machine ip default` if still with virtualbox

## Example(s)

### Example 1

```
docker run -d --rm --name="ride" -v $(pwd)/config:/config:rw -v $(pwd)/robot:/robot -p 8080:8080  ivonet/robotframework-ride
```

* Runs the Robotframework Ride IDE in deamon mode with the config in the current folder/config and testfiles in the current folder/robot dir.
* Runs on port 8080
* The image is called ride during run phase
* When stopped the named (ride) image is removed. 
* [Show in browser](http://localhost:8080) (assuming that you run docker native)


### Example 2

```
docker run -it --rm --name "robot" -v $(pwd):/mnt -v $(pwd)/robot:/robot -p 8888:8080  ivonet/robotframework-ride /bin/sh
```

* runs in interactive mode 
* image is called robot
* port 8888 is mapped to 8080 in vm
* mounts the current folder on virtual machine /mnt folder
* enters the shell 
* you can access play around with the system to try stuff out through the commandline
* the image will be removed after stopping the instance
* command `/sbin/my_init` with start the gui server
* [Show in browser](http://localhost:8888) (assuming that you run docker native and you ran the gui server)

