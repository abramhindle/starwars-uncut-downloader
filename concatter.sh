OUTPUT=""
for file in swunct-*flv
do
	echo $file.mpg: $file
	echo "\tffmpeg -i $file -target ntsc-dvd $file.mpg"
	OUTPUT="$OUTPUT $file.mpg"
done
echo swuncut.mpg: $OUTPUT
echo "\tcat $OUTPUT  > swuncut.mpg"
