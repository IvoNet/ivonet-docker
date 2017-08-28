# ivonet/hexo

This image contains a Hexo distro

# Usage example(s)

Start hexo in interactive mode with two folders mounted...

`docker run --rm --name hexo -it -v $(pwd)/blog:/blog -v $(pwd)/scripts:/scripts -p 4000:4000 ivonet/hexo`

# /script

This folder can be used to install "aftermarket" stuff :-)
if you put a shell script in that folder and restart docker it will be executed in the docker container

# /blog

this folder contains the blog. If empty it will be filled with a default `landscape` theme
if it already contains tuff then it will just start the server