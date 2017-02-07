tmate-docker
============

Tmate.io docker server

Run it as a privileged image, as tmate requires some special capabilitites

If you want to build it:
```bash
docker build -t ivonet/tmate .
```

If you want to use it, and you build it:
```bash
docker run -d --privileged --rm --name tmate -e HOST=localhost -e PORT=2222 -p 2222:2222 -t ivonet/tmate
```
This will start the docker tmate image in demon mode on your local machine listening on port 2222

To get to connect to this tmate server you need to do 1 other thing

```bash
docker logs tmate
```
will result in something like: 

```text
Add this to your /root/.tmate.conf file
set -g tmate-server-host localhost
set -g tmate-server-port 2222
set -g tmate-server-rsa-fingerprint "d9:de:f8:b5:98:77:f3:84:a8:c0:c1:00:52:c3:9d:0d"
set -g tmate-server-ecdsa-fingerprint "60:43:63:6b:c1:7e:0c:52:66:e2:e4:9d:e3:93:c3:04"
<5> (tmate) Accepting connections on :2222
```

Add the lines beginning with `set` to a file called ~/.tmate.conf 

No you have a tmate server running. No don't forget to install a local tmate client.

On a mac with [Homebrew](http://brew.sh) just install with `brew install tmate`

Open two terminals and start tmate in one. It should give a result something like:

```bash
ssh -p2222 Q7EYDeZ4Eu1hSw2FH9xRhzQ6M@localhost
```
if you copy and paste that result into the other terminal you have a 
terminal mate and you can do your presentations with one terminal 
on the big screen and one on your laptop.