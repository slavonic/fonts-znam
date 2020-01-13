all: fonts

FONTS = Smolensky Mezenets

fonts:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE); cd ..;)

web:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) web; cd ..;)

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
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) clean; cd ..;)
	rm -f *.zip *.png docs/*.aux docs/*.log docs/*.out docs/out/ docs/*.toc *.pdf
