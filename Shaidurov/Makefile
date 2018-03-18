all: ShaidurovUnicode.zip

ShaidurovUnicode.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	ttx -m ShaidurovUnicode.otf colordata.ttx
	rm ShaidurovUnicode.otf
	mv colordata.otf ShaidurovUnicode.otf
	rm -f colordata2.ttx
	sed 's/"OTTO"/"\\x00\\x01\\x00\\x00"/' < colordata.ttx > colordata2.ttx
	ttx -m ShaidurovUnicode.ttf colordata2.ttx
	rm ShaidurovUnicode.ttf
	mv colordata2.ttf ShaidurovUnicode.ttf
	rm colordata2.ttx
	cp README.md README
	zip -j $@ ShaidurovUnicode.otf ShaidurovUnicode.ttf README
	rm -f README

web: ShaidurovUnicode-web.zip

ShaidurovUnicode-web.zip:
	rm -f *.otf *.ttf *.woff *.zip *.eot *.woff2
	fontforge -script web-generate.py
	ttx -m ShaidurovUnicode.otf colordata.ttx
	rm ShaidurovUnicode.otf
	mv colordata.otf ShaidurovUnicode.otf
	rm -f colordata2.ttx
	sed 's/"OTTO"/"\\x00\\x01\\x00\\x00"/' < colordata.ttx > colordata2.ttx
	ttx -m ShaidurovUnicode.ttf colordata2.ttx
	rm ShaidurovUnicode.ttf
	mv colordata2.ttf ShaidurovUnicode.ttf
	rm colordata2.ttx
	ttf2eot < ShaidurovUnicode.ttf > ShaidurovUnicode.eot
	sfnt2woff -m ShaidurovUnicode-WOFF-metadata.xml ShaidurovUnicode.otf
	woff2_compress ShaidurovUnicode.otf
	cp README.md README
	zip -j $@ ShaidurovUnicode.otf ShaidurovUnicode.ttf ShaidurovUnicode.eot ShaidurovUnicode.woff ShaidurovUnicode.woff2 README ../css/fonts.css
	rm -f README

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

