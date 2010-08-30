for file in swunct-*flv
do
	ffmpeg -i $file -target ntsc-dvd $file.mpg
done
cat swunct-*.flv.mpg | ffmpeg -f mpeg -i - -vcodec copy -acodec copy swuncut.mpg
