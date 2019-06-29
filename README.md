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

Building the fonts requires Python and FontForge.

## License

Fonts are licensed under the SIL Open Font License v. 1.1
without reserved font names.

## Disclaimer

This package is alpha-phase software and is intended for
software testing purposes only.

