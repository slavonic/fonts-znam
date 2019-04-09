all: fonts

FONTS = Shaidur Mezenets

fonts:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE); cd ..;)

web:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) web; cd ..;)

docs: fonts-znam.pdf

fonts-znam.pdf:
	(cd docs/; rm -f *.aux *.log *.out fonts-znam.pdf *.toc)
	(cd docs/; lualatex --interaction=nonstopmode fonts-znam.tex)
	(cd docs/; lualatex --interaction=nonstopmode fonts-znam.tex)

clean:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) clean; cd ..;)
	rm -f *.zip *.png docs/*.aux docs/*.log docs/*.out docs/fonts-znam.pdf docs/*.toc

