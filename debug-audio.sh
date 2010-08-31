( for file in *flv.mpg; do echo $file `mplayer $file -vo null -ao null -identify -frames 1 | fgrep AUDIO | wc -l`; done ) | tee lookin

