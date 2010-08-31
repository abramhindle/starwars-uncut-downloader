for file in swunct-012.flv swunct-096.flv swunct-338.flv swunct-341.flv
do
	rm -f $file.mpg
	ffmpeg -i $file -i silence.wav -itsoffset 3 -acodec ac3 -ab 192k -map 0:0 -map 1:0 -target ntsc-dvd $file.mpg
done

