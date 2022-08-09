all: backImage.tiff

backImage.tiff: openrtp2_800x400.tiff openrtp2_1600x800.tiff
	tiffutil -cathidpicheck openrtp2_800x400.tiff openrtp2_1600x800.tiff -out backImage.tiff

clean:
	rm -f backImage.tiff