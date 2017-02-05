# Draw.io contained :-)

This docker enables Draw.io
 
## usage

docker run -d --rm --name draw -p 4000:80 -p 4443:443 ivonet/draw.io

[localhost](http://localhost:4000/draw.io/war/index.html?offline=1&libs=eip)
(the 'libs=eip' is optional but demonstrates the filtering of drawing tools)

## build

docker build -t ivonet/draw.io .