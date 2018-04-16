all: SmolenskyUnicode.zip

SmolenskyUnicode.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	cp README.md README
	zip -j $@ SmolenskyUnicode.otf SmolenskyUnicode.ttf README
	rm -f README

web: SmolenskyUnicode-web.zip

SmolenskyUnicode-web.zip:
	rm -f *.otf *.ttf *.woff *.zip *.eot *.woff2
	fontforge -script web-generate.py
	ttf2eot < SmolenskyUnicode.ttf > SmolenskyUnicode.eot
	sfnt2woff -m SmolenskyUnicode-WOFF-metadata.xml SmolenskyUnicode.otf
	woff2_compress SmolenskyUnicode.otf
	cp README.md README
	zip -j $@ SmolenskyUnicode.otf SmolenskyUnicode.ttf SmolenskyUnicode.eot SmolenskyUnicode.woff SmolenskyUnicode.woff2 README ../css/fonts.css
	rm -f README

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

