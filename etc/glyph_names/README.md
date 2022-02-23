# glyph names

The file `glyph_names.csv` are suggested glyph names for characters to use in font sources.
It covers most of the characters you might want to import from a Latin script font for a non-Roman font.
Built fonts (such as `.ttf`) should have [AGLFN](https://github.com/adobe-type-tools/agl-aglfn) glyph names.
The [license](LICENSE.md) file is from the above repo, with the addition of copyright information,
and covers `glyph_names.csv`.

## History

The list of glyph names was originally called `aglfn-nr.csv` in another repo.
It was started by
- copying the file `aglfn.txt` from the above repo
- removing all the comments
- changing the field separator from a `;` to a `,`
- adding additional glyph names, mostly following `glyphlist.txt` from the above repo
- Rename Omega to Omegagreek so it is not confused with Ohm (U+2126) which is called Omega in AGLFN
