all: Smolensky.zip

Smolensky.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	cp README.md README
	zip -j $@ Smolensky-Regular.otf README
	rm -f README

web: Smolensky-web.zip

Smolensky-web.zip:
	rm -f *.otf *.ttf *.woff *.zip *.eot *.woff2
	fontforge -script web-generate.py
	ttf2eot < Smolensky-Regular.ttf > Smolensky-Regular.eot
	sfnt2woff -m Smolensky-Regular-WOFF-metadata.xml Smolensky-Regular.otf
	woff2_compress Smolensky-Regular.otf
	cp README.md README
	zip -j $@ Smolensky-Regular.otf Smolensky-Regular.eot Smolensky-Regular.woff Smolensky-Regular.woff2 README ../css/fonts.css
	rm -f README

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt

