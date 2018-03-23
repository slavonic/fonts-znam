all: fonts

FONTS = Shaidur Mezenets

fonts:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE); cd ..;)

web:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) web; cd ..;)

clean:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) clean; cd ..;)
	rm -f *.zip *.png

