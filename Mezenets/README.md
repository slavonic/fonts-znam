# Mezenets Unicode

Mezenets Unicode is a font for modern Znamenny Notation.
The font is named after the medieval theoretician of Znamenny chant
[Aleksandr Mezenets](http://www.pravenc.ru/text/64380.html).

## Author

The glyphs were drawn by Nikita Simmons. OpenType features and fine-tuning
by Aleksandr Andreev.

## Disclaimer

This font is beta-stage software, and is intended for software testing purposes only.

## Encoding

Znamenny Notation has been proposed for encoding by the authors, but has not yet
been accepted by the Unicode Technical Committee. Proposed codepoints are subject
to change. Please consult [the proposal](https://www.ponomar.net/files/palaeoslavic.pdf)
and the font documentation for more information.

## Building the font

Building the font requires [FontForge](https://fontforge.github.io/en-US/) and
the [fontTools Python library](https://github.com/fonttools/fonttools). To build, run:

```
make all
```

This creates a ZIP archive containing the font and documentation.

Building web fonts requires additionally [ttf2eot](https://github.com/wget/ttf2eot),
[sfnt2woff](https://github.com/kseo/sfnt2woff), and
[woff2_compress](https://github.com/google/woff2). To build web fonts, run:

```
make web
```

This creates a ZIP archive containing OTF, EOT, WOFF, WOFF2 fonts and documentation.

## Testing

Because of the complexity of the font's OpenType features, regression tests
have been created to make sure that new design features don't break support for existing
features. If you make any changes to the font, you should run the regression tests:

``make test``

This creates the file `test-result.pdf` in which all differences against the baseline
are indicated in red. **Note**: running tests requires LaTeX, GhostScript and
ImageMagick, and takes a long time.

To make new baselines for the regression tests, run:

``make baseline``

**Note**: you should never do this, unless you are the package manager.
