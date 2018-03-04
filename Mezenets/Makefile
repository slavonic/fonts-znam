all: MezenetsUnicode.zip

MezenetsUnicode.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	ttx -m MezenetsUnicode.otf colordata.ttx
	rm MezenetsUnicode.otf
	mv colordata.otf MezenetsUnicode.otf
	rm -f colordata2.ttx
	sed 's/"OTTO"/"\\x00\\x01\\x00\\x00"/' < colordata.ttx > colordata2.ttx
	ttx -m MezenetsUnicode.ttf colordata2.ttx
	rm MezenetsUnicode.ttf
	mv colordata2.ttf MezenetsUnicode.ttf
	rm colordata2.ttx
	cp README.md README
	zip -j $@ MezenetsUnicode.otf MezenetsUnicode.ttf README
	rm -f README

web: MezenetsUnicode-web.zip

MezenetsUnicode-web.zip:
	rm -f *.otf *.ttf *.woff *.zip *.eot *.woff2
	fontforge -script web-generate.py
	ttx -m MezenetsUnicode.otf colordata.ttx
	rm MezenetsUnicode.otf
	mv colordata.otf MezenetsUnicode.otf
	rm -f colordata2.ttx
	sed 's/"OTTO"/"\\x00\\x01\\x00\\x00"/' < colordata.ttx > colordata2.ttx
	ttx -m MezenetsUnicode.ttf colordata2.ttx
	rm MezenetsUnicode.ttf
	mv colordata2.ttf MezenetsUnicode.ttf
	rm colordata2.ttx
	ttf2eot < MezenetsUnicode.ttf > MezenetsUnicode.eot
	sfnt2woff -m MezenetsUnicode-WOFF-metadata.xml MezenetsUnicode.otf
	woff2_compress MezenetsUnicode.otf
	cp README.md README
	zip -j $@ MezenetsUnicode.otf MezenetsUnicode.ttf MezenetsUnicode.eot MezenetsUnicode.woff MezenetsUnicode.woff2 README ../css/fonts.css
	rm -f README

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

