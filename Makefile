all: fonts

FONTS = Smolensky Mezenets

fonts:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE); cd ..;)

clean:
	$(foreach font, $(FONTS), cd $(font)/ && $(MAKE) clean; cd ..;)
	rm -f *.zip *.png

