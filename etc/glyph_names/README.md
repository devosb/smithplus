# Glyph names

The file `glyph_names.csv` are suggested glyph names for characters to use in font sources.
It covers most of the characters you might want to import from a Latin script font for a non-Roman font.
Built fonts (such as `.ttf`) should have [AGLFN](https://github.com/adobe-type-tools/agl-aglfn) glyph names.
The [license](LICENSE.md) file is from the above repo, with the addition of copyright information,
and covers `glyph_names.csv`.

# Characters

- U+2206 INCREMENT looks like U+0394 GREEK CAPITAL LETTER 
DELTA
- U+2126 OHM SIGN + NFC = U+03A9 GREEK CAPITAL LETTER OMEGA
- U+00B5 MICRO SIGN + NFKC = U+03BC GREEK SMALL LETTER MU

## AGLFN

The AGLFN names below (middle field) used the non-Greek codepoints, ./,makethen switched to the Greek codepoints, then back.

- 2206;Delta;INCREMENT
- 2126;Omega;OHM SIGN
- 00B5;mu;MICRO SIGN

## Glyphs.App

- U+2206 increment
- U+2126 Ohm
- U+00B5 micro

## Import

OMEGA could be a composite of OHM,
since NFC would convert to OMEGA,
and OMEGA is in the MacRoman character set
(but used to use OHM),
unlike the other Greek codepoints listed above.

# History

The list of glyph names was originally called `aglfn-nr.csv` in another repo.
It was started by
- copying the file `aglfn.txt` from the above repo
- removing all the comments
- changing the field separator from a `;` to a `,`
- adding additional glyph names, mostly following `glyphlist.txt` from the above repo
