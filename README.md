# fonts-znam

OpenType fonts for Znamenny Notation

OpenType шрифты для знаменной нотации

## Description

This repository provides fonts for typesetting Znamenny and other related
Slavic neumatic music notations systems (Demestvenny, Put, Kondakarian).

All fonts provide necessary OpenType features and supply
PostScript (.otf) outlines for glyphs. Note that support for SIL Graphite
features has been discontinued.

## Encoding

Znamenny and related notation systems have been accepted for encoding
in version 14 of Unicode.
The proposed codepoints are specified in the
[proposal](https://www.ponomar.net/files/palaeoslavic.pdf). These codepoints
have been approved by the 
[UTC](http://www.unicode.org/consortium/utc.html), but may still change
before the release of Unicode 14.0.

## Building

To build fonts:

```
make fonts
```
## Requirements

The fonts include color data in both COLR / CPAL format and OpenType-SVG format.
Building the fonts requires:

* Python 3.6 or later
* [FontForge](https://github.com/fontforge/fontforge)
* [FontTools 3.1.0 or later](https://github.com/fonttools/fonttools)
* [opentype-svg](https://github.com/adobe-type-tools/opentype-svg)
* [gftools](https://github.com/googlefonts/gftools)

The latter three packages can be installed via `pip`:

```
pip3 install fonttools
pip3 install opentypesvg
pip3 install gftools
```

## License

Fonts are licensed under the SIL Open Font License v. 1.1
without reserved font names.


## Documentation

Font documentation is available on [the website](https://www.ponomar.net/files/fonts-znam.pdf).

## Disclaimer

This package is beta-stage software and is intended primarily for
software testing purposes.

