# Mezenets Unicode

Mezenets Unicode is a font for modern Znamenny Notation.
The font is named after the medieval theoretician of Znamenny chant
[Aleksandr Mezenets](http://www.pravenc.ru/text/64380.html).

## Author

The glyphs were created by Nikita Simmons and reencoded for Unicode by
Aleksandr Andreev.

## Disclaimer

This font is alpha-phase software, and is intended for software testing purposes only.

## Encoding

Znamenny and related notation systems are not yet available in Unicode.
As an encoding model is developed, the notation symbols are temporarily
encoded in the Private Use Area portion of Unicode for testing purposes.
See the [Ponomar Private Use Area Policy](http://www.ponomar.net/files/pua_policy.pdf)
for information and codepoints.

## Testing

Because of the complexity of the font's OpenType features, regression tests
have been created to make sure that new design features don't break support for existing
features. If you do any work with the OpenType tables, you should run the tests:

``make test``

This creates the file `test/test-results.pdf` in which all differences against the baseline
are indicated in red. The first line of the file contains a timestamp and always changes
(this makes sure that the tests have, in fact, run). All other lines should be blank;
if they are not (if something is red), then you have a regression. You can view the
offending GSUB mapping in the file `test/gsub.pdf`.

Note: running tests requires LaTeX, Ghostscript and ImageMagick.

The command

``make baseline``

regenerates the baseline images for regression testing. You should run this command
only if you are absolutely sure that your change fixes a bug in the OpenType tables.
