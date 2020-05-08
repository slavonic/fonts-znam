# fonts-znam

OpenType fonts for Znamenny Notation

OpenType шрифты для знаменной нотации

## Description

This repository provides fonts for typesetting Znamenny and other related
Slavic neumatic music notations systems (Demestvenny, Put, Kondakarian).

All fonts provide necessary OpenType features and come
both with PostScript (.otf) outlines. Note that support for SIL Graphite
features has been discontinued.

## Encoding

Znamenny and related notation systems are not yet available in Unicode.
The proposed codepoints are specified in the
[proposal](https://www.ponomar.net/files/palaeoslavic.pdf). These codepoints
have not yet been approved by the 
[UTC](http://www.unicode.org/consortium/utc.html) and may be subject to change.

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

The latter two packages can be installed via `pip`:

```
pip3 install fonttools
pip3 install opentypesvg
```

## License

Fonts are licensed under the SIL Open Font License v. 1.1
without reserved font names.

## Disclaimer

This package is alpha-phase software and is intended for
software testing purposes only.

