# fonts-znam

[![Build Status](https://api.travis-ci.com/slavonic/fonts-znam.svg?branch=master)](https://travis-ci.com/slavonic/fonts-znam/)

OpenType fonts for Znamenny Notation

OpenType шрифты для знаменной нотации

## Description

This repository provides fonts for typesetting Znamenny and other related
Slavic neumatic music notations systems (Demestvenny, Put, Kondakarian).

All fonts provide necessary OpenType and SIL Graphite features and come
both with PostScript (.otf) and TrueType (.ttf) outlines.

## Encoding

Znamenny and related notation systems are not yet available in Unicode.
As an encoding model is developed, the notation symbols are temporarily
encoded in the Private Use Area portion of Unicode for testing purposes.
See the [Ponomar Private Use Area Policy](http://www.ponomar.net/files/pua_policy.pdf)
for information and codepoints.

## Building

To build fonts:

```
make fonts
```
## Requirements

Building the fonts requires Python, FontForge and the SIL GDL compiler.

## License

Fonts are licensed under either the GNU General Public License v. 3.0
(with the font exception) or under the SIL Open Font License v. 1.1
without reserved font name, at your choosing.

## Disclaimer

This package is alpha-phase software and is intended for
software testing purposes only.

