tmate-docker
============

Tmate.io docker server

Run it as a priviledged image, as tmate requires some special capabilitites: CLONE_NEWIPC and CLONE_NEWNET

If you want to build it:
```
docker build -t tmate-docker .
```

If you want to use it, and you build it:
```
sudo docker run --privileged -p 2222 -t tmate-docker
```

To know which port was tmate bound to, run:
```
docker ps # this will show you the container id
docker port <container id> 2222
```

By default tmate-docker will bind inside the container on port 2222. This means that the ssh command that tmate will give you will include that port.
Sometimes you want to run on a different port. To do that you need to set the ```PORT``` environment variable, this will be the one that tmate will bind to inside the container.

In a similar manner, the advertised hostname to connect to can be
changed with the ```HOST``` environment variable. By default, the docker
container name is used.

For example:
```
docker run --privileged -e HOST=example.com -e PORT=443 -p 443:443 -t tmate-docker
```
