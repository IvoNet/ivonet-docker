# ivonet/mysql Docker image

A Made specific image for MySQL based on the standard mysql image.

This image has to be build on your local machine to make the 
development environment work.

This image is tuned to monitor a TEST_DIR folder file up and running.
if you put sql files into this folder they will be executed on the database
and when done removed.

## How to build

* Run `build.sh` from this folder

## What it does

* Create a mysql image
* Add a custom entrypoint
* Configures mysql to monitor for testdata
* Create an image tagged as `ivonet/mysql`
* Push the image to docker hub


## Why

My version of the MySql image exposes a `/testdata` folder and that folder is monitored for changes.
When changes detected it will execute it on the running database.
You can put testdata sql files there.