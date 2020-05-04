all: MezenetsUnicode.zip

MezenetsUnicode.zip:
	# THIS GENERATES THE INSTALLABLE VERSIONS OF THE FONT
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	ttx -m MezenetsUnicode.otf colordata.ttx
	rm MezenetsUnicode.otf
	mv colordata.otf MezenetsUnicode.otf
	addsvg -s SVGs/ MezenetsUnicode.otf 
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
	rm -f *.otf *.ttf *.zip
	fontforge -script hp-generate.py
	rm -fr tests/output
	rm -fr tests/results
	rm -fr test-result.pdf
	mkdir tests/output
	(cd tests/; i=0; while read -r in; do i=$$(($$i+1)); sed -e s/foo/"$$in"/ regtest.tex > output/"$$i".tex; lualatex --interaction=nonstopmode --output-directory=output/ output/"$$i".tex; done < foo.lst)
	(cd tests/output; rm -fr *.aux *.log *.tex)
	mkdir tests/results
	(cd tests/; i=0; j=0; while read in; do i=$$(($$i+1)); compare -metric phash baseline/"$$i".pdf output/"$$i".pdf results/"$$i".pdf || j=$$(($$j+$$?)); echo ""; done < foo.lst; gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/screen -sOutputFile=test-result.pdf results/*.pdf; cp test-result.pdf ../test-result.pdf; rm -fr results/; rm -fr output/; exit "$$j")

clean:
	rm -f *.otf *.ttf *.woff *.eot *.woff2 *.zip gdlerr.txt test-result.pdf
	rm -fr tests/result
	rm -fr tests/out
	rm -f tests/*.aux tests/*.log tests/*.pdf
