all: ShaidurUnicode.zip

ShaidurUnicode.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	ttx -m ShaidurUnicode.otf colordata.ttx
	rm ShaidurUnicode.otf
	mv colordata.otf ShaidurUnicode.otf
	cp README.md README
	zip -j $@ ShaidurUnicode.otf ShaidurUnicode.ttf README
	rm -f README

web: ShaidurUnicode-web.zip

ShaidurUnicode-web.zip:
	rm -f *.otf *.ttf *.woff *.zip *.eot *.woff2
	fontforge -script web-generate.py
	ttx -m ShaidurUnicode.otf colordata.ttx
	rm ShaidurUnicode.otf
	mv colordata.otf ShaidurUnicode.otf
	rm -f colordata2.ttx
	sed 's/"OTTO"/"\\x00\\x01\\x00\\x00"/' < colordata.ttx > colordata2.ttx
	ttx -m ShaidurUnicode.ttf colordata2.ttx
	rm ShaidurUnicode.ttf
	mv colordata2.ttf ShaidurUnicode.ttf
	rm colordata2.ttx
	ttf2eot < ShaidurUnicode.ttf > ShaidurUnicode.eot
	sfnt2woff -m ShaidurUnicode-WOFF-metadata.xml ShaidurUnicode.otf
	woff2_compress ShaidurUnicode.otf
	cp README.md README
	zip -j $@ ShaidurUnicode.otf ShaidurUnicode.ttf ShaidurUnicode.eot ShaidurUnicode.woff ShaidurUnicode.woff2 README ../css/fonts.css
	rm -f README

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

