all: site

FONTS = Voskresensky Mezenets
OLDFONTS = Smolensky Mezenets

unicode:
	$(foreach font, $(OLDFONTSFONTS), cd $(font)/ && $(MAKE); cd ..;)

site: fonts-znam.zip

fonts-znam.zip:
	rm -fr fonts-znam/
	mkdir fonts-znam/
	cd fonts-znam/ && curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/main/fonts/ttf/$(font)-Regular.ttf)
	cp OFL.txt fonts-znam/
	cp README.md fonts-znam/README
	zip -r -q fonts-znam.zip fonts-znam/
	rm -fr fonts-znam/

web: znam-web.zip

znam-web.zip:
	rm -fr znam-web/
	mkdir znam-web/
	cd znam-web/ && curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/main/fonts/ttf/$(font)-Regular.ttf)
	cd znam-web/ && curl $(foreach font, $(FONTS), -O https://raw.githubusercontent.com/slavonic/$(font)/main/fonts/webfonts/$(font)-Regular.woff2)
	$(foreach font, $(FONTS), cd znam-web/ && ttf2eot $(font)-Regular.ttf $(font)-Regular.eot; cd ..;)
	zip -j $@ OFL.txt
	zip -DrX $@ css/ znam-web/
	rm -fr znam-web/

docs: fonts-znam.pdf

fonts-znam.pdf:
	(cd docs/; rm -f *.aux *.log *.out fonts-znam.pdf *.toc)
	(cd docs/; lilypond-book --out out --pdf fonts-znam.tex)
	cp docs/cu-kruk.sty docs/out/
	(cd docs/out/; lualatex --interaction=nonstopmode fonts-znam.tex)
	(cd docs/out/; lualatex --interaction=nonstopmode fonts-znam.tex)
	(cd docs/out/; lualatex --interaction=nonstopmode fonts-znam.tex)
	mv docs/out/fonts-znam.pdf fonts-znam.pdf
	rm -fr docs/out/

clean:
	rm -f *.zip *.png docs/*.aux docs/*.log docs/*.out docs/out/ docs/*.toc *.pdf
