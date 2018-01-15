all: MezenetsUnicode.woff2

MezenetsUnicode.woff2:
	rm -f *.otf *.ttf *.woff
	fontforge -script hp-generate.py
	ttx -m MezenetsUnicode.otf colordata.ttx
	rm MezenetsUnicode.otf
	mv colordata.otf MezenetsUnicode.otf
	woff2_compress MezenetsUnicode.otf

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

