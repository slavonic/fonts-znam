all: MezenetsUnicode.otf

MezenetsUnicode.otf:
	rm -f *.otf *.ttf *.woff
	fontforge -script hp-generate.py

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

