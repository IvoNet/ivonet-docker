# mkv tools

This images knows a few mkvtools

# Why

These tools are not available for the main part on a Synology NAS
but I do want to use them there
so I made an image and exposed a few volumes to make them 
work as my NAS does support docker.

# What

This images contains the following tools:

* handbrake-cli
* mkvtoolnix toolset
* ffmpeg
* melt
* mencoder
* atomicparsley

# Examples

* See [this blog][http://ivo2u.nl/dA] on how to use handbrake on your nas

```bash
docker run \
   --rm \
   -v "$(pwd):/input:ro" \
   -v "$(pwd):/output:rw" \
   ivonet/videotools:latest \
   -i "/input/The.BFG.2016.mkv" \
   -o "/output/The.BFG.2016.m4v" \
   -e x264  -q 20.0 -r 30 --pfr  -a 1 -E faac -B 160 -6 dpl2 -R Auto -D 0.0 \
   --audio-copy-mask aac,ac3,dtshd,dts,mp3 --audio-fallback ffac3 -f mp4 \
   -X 1280 -Y 720 --loose-anamorphic --modulus 2 -m \
   --x264-preset medium --h264-profile high --h264-level 3.1
```

* Removes the 'state' when done
* Maps the current folder to the `input` and `output` volumes of the image
* uses the `ivonet/videotools` images
* runs HandbrakeCLI with all the options provided as handbrake is the ENTRYPOINT of the image


```bash
docker run \
   --rm \
   -it \
   -v "$(pwd):/input:ro" \
   -v "$(pwd):/output:rw" \
   --entrypoint "mkvmerge" \
   ivonet/videotools:latest \
   --help
```

* Removes the 'state' when done
* Maps the current folder to the `input` and `output` volumes of the image
* make mkvmerge the entrypoint
* uses the `ivonet/videotools` images
* gives mkvmerge --help as the parameter


```bash
docker run \
   --rm \
   -it \
   --name mkvmerge \
   -v "$(pwd):/input:ro" \
   -v "$(pwd):/output:rw" \
   --entrypoint "mkvmerge" \
   ivonet/videotools:latest \
   -o /output/output.mkv \
   --audio-tracks 2 \
   /input/The.BFG.2016.mkv
```

* Removes the 'state' when done
* Maps the current folder to the `input` and `output` volumes of the image
* make mkvmerge the entrypoint
* uses the `ivonet/videotools` images
* gives mkvmerge the provided options as the parameter.
    * output file written to output/output.mkv
    * add audiotrack 2 from origional mkv
    * process the /input/...mkv file
* don't forget the add the input and output folderd in your commandline options.


```bash
docker run \
   --rm \
   -it \
   --name mkvmerge \
   -v "$(pwd):/input:ro" \
   -v "$(pwd):/output:rw" \
   --entrypoint "ffmpeg" \
   ivonet/videotools:latest \
   --help
```

* Removes the 'state' when done
* Maps the current folder to the `input` and `output` volumes of the image
* make ffmpeg the entrypoint
* uses the `ivonet/videotools` images
* asks ffmpeg to print the help

```bash
docker run \
   --rm \
   -it \
   --name mkvmerge \
   -v "$(pwd):/input:ro" \
   -v "$(pwd):/output:rw" \
   --entrypoint "ffmpeg" \
   ivonet/videotools:latest \
   -i /input/bfg.mkv -map 0 -c:a copy -c:s copy -c:v libx264 /output/output.mkv
```

* Removes the 'state' when done
* Maps the current folder to the `input` and `output` volumes of the image
* make ffmpeg the entrypoint
* uses the `ivonet/videotools` images
* asks ffmpeg to print the help

