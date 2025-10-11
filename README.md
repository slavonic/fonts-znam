# fonts-znam

This a meta package for Unicode-encoded OpenType fonts for Znamenny Notation.
Individual fonts now reside in their own repositories and any bugs should be filed as issues against those repositories.

## The fonts available

* [Mezenets](https://github.com/slavonic/Mezenets) - a font for modern Znamenny Notation with or without priznaki
* [Shaidur](https://github.com/slavonic/Shaidur) - a font for early-seventeenth-century Znamenny Notation without priznaki (Type B Notation)
* [Voskresensky](https://github.com/slavonic/Voskresensky) - a font for early (archaic) Znamenny Notation and Ustav-era Cyrillic

The source code of the fonts is found in the repositories above. The fonts can be installed from those repositories or from the [project website](https://sci.ponomar.net/music.html).

## This package

This package provides:

* An archive of all of the fonts, including web fonts.
* The documentation

## Legacy fonts

Mezenets was previously distributed with the word *Unicode* in its name as *Mezenets Unicode*. With the nearly universal adoption of Unicode this feature seems no longer necessary, so the term Unicode has been removed. You may still need Mezenets Unicode for processing of older documents and it is also supplied in this package. As well, the Smolensky font has been discontinued since it has been merged with the Voskresensky font. These fonts are no longer maintained and are provided here only for use with legacy documents:

* [Mezenets Unicode](Mezenets/MezenetsUnicode.otf)
* [Smolensky](Smolensky/Smolensky-Regular.otf)

## Installation

### Font Binaries

All fonts can be downloaded and installed from the
[Slavonic Computing Initiative website](https://sci.ponomar.net/music.html).

### Building this respository

Building requires:

* [ttf2eot](https://github.com/fontello/ttf2eot) - to build web fonts
* LuaLaTeX with [churchslavonic](https://www.ctan.org/pkg/churchslavonic) package - to build PDF documentation

To build the Mezenets Unicode and Smolensky fonts:

```
make unicode
```

To build documentation:

```
make doc
```
To build the package for the [website](https://sci.ponomar.net/):

```
make site
```

To build the fonts for embedding into webpages, also distributed on the site:

```
make web
```

Clean up after building:

```
make clean
```

## License

Copyright 2013-2025 Aleksandr Andreev, Nikita Simmons, and others
([Slavonic Computing Initiative](https://sci.ponomar.net/)).
The fonts are licensed under the SIL Open Font License, Version 1.1.
This license is available [with a FAQ](https://scripts.sil.org/OFL).
