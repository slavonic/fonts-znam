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

baseline:
	(cd tests; lualatex --interaction=nonstopmode gsub.tex)
	(cd tests; lualatex --interaction=nonstopmode gsub.tex)
	(cd tests; gs -dNOPAUSE -dBATCH -sDEVICE=pngalpha -r150 -sOutputFile="baseline/%d.png" gsub.pdf; cd ..;)

azbuka:
	(cd tests; lualatex --interaction=nonstopmode kalashnikov.tex)
	(cd tests; lualatex --interaction=nonstopmode kalashnikov.tex)

demestvenny:
	(cd tests; lilypond-book --output out --pdf demestvenny.tex)
	(cd tests/out; lualatex --interaction=nonstopmode demestvenny.tex)
	(cd tests/out; lualatex --interaction=nonstopmode demestvenny.tex)
	(cd tests; mv out/demestvenny.pdf ./)

test: test-result.pdf

test-result.pdf:
	(cd tests; lualatex --interaction=nonstopmode gsub.tex)
	(cd tests; lualatex --interaction=nonstopmode gsub.tex)
	(cd tests; gs -dNOPAUSE -dBATCH -sDEVICE=pngalpha -r150 -sOutputFile="%d.png" gsub.pdf; mkdir -p result; cd ..;)
	$(foreach f, $(shell ls tests/*.png), compare $(f) $(subst tests, tests/baseline, $(f)) -compose src $(subst tests, tests/result, $(f)); echo 'Done';)
	(cd tests/; convert result/*.png test-result.pdf; cd ..; )
	rm -fr tests/result
	rm -f tests/*.png

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt
	rm -fr tests/result
	rm -fr tests/out
	rm -f tests/*.aux tests/*.log tests/*.pdf
