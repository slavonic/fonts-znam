NUMBERS = 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24

all: MezenetsUnicode.zip

MezenetsUnicode.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	ttx -m MezenetsUnicode.otf colordata.ttx
	rm MezenetsUnicode.otf
	mv colordata.otf MezenetsUnicode.otf
#	rm -f colordata2.ttx
#	sed 's/"OTTO"/"\\x00\\x01\\x00\\x00"/' < colordata.ttx > colordata2.ttx
#	ttx -m MezenetsUnicode.ttf colordata2.ttx
#	rm MezenetsUnicode.ttf
#	mv colordata2.ttf MezenetsUnicode.ttf
#	rm colordata2.ttx
	cp README.md README
	zip -j $@ MezenetsUnicode.otf README
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
	zip -j $@ MezenetsUnicode.otf MezenetsUnicode.eot MezenetsUnicode.woff MezenetsUnicode.woff2 README ../css/fonts.css
	rm -f README

baseline:
	rm -fr tests/baseline
	mkdir tests/baseline
	(cd tests/; i=0; while read -r in; do i=$$(($$i+1)); sed -e s/foo/"$$in"/ regtest.tex > baseline/"$$i".tex; lualatex --output-directory=baseline/ baseline/"$$i".tex; done < foo.lst)
	(cd tests/baseline; rm -fr *.aux *.log *.tex)

azbuka:
	(cd tests; lualatex --interaction=nonstopmode kalashnikov.tex)
	(cd tests; lualatex --interaction=nonstopmode kalashnikov.tex)

demestvenny:
#	(cd tests; lilypond-book --output out --pdf demestvenny.tex)
#	(cd tests/out; lualatex --interaction=nonstopmode demestvenny.tex)
#	(cd tests/out; lualatex --interaction=nonstopmode demestvenny.tex)
#	(cd tests; mv out/demestvenny.pdf ./)
	(cd tests; lualatex --interaction=nonstopmode demestvenny.tex)
	(cd tests; lualatex --interaction=nonstopmode demestvenny.tex)

test: test-result.pdf

test-result.pdf:
	(cd tests; lualatex --interaction=nonstopmode gsub.tex)
	(cd tests; lualatex --interaction=nonstopmode gsub.tex)
	(cd tests; gs -dNOPAUSE -dBATCH -sDEVICE=pngalpha -r150 -sOutputFile="%d.png" gsub.pdf; mkdir -p result; cd ..;)
	$(foreach f, $(NUMBERS), compare tests/$(f).png tests/baseline/$(f).png tests/result/$(f).png; echo 'Done';)
	(cd tests/; convert result/*.png test-result.pdf; cd ..; )
	rm -fr tests/result
	rm -f tests/*.png

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt
	rm -fr tests/result
	rm -fr tests/out
	rm -f tests/*.aux tests/*.log tests/*.pdf
