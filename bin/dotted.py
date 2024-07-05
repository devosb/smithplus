#!/usr/bin/python3

from fontParts.world import *
import string
import os.path
import argparse


def glyphname2filename(glyph_name):
    """Return base file name of the glyph"""
    filename = ''
    for char in glyph_name:
        filename += char
        if char in string.ascii_uppercase:
            filename += '_'
    return filename


def main():
    parser = argparse.ArgumentParser(description='Dottify glyph outlines')
    parser.add_argument('outline', help='Outline source font')
    parser.add_argument('dotted', help='Dotted target font')
    parser.add_argument('--version', action='version', version='%(prog)s 0.1')
    args = parser.parse_args()

    outline = OpenFont(args.outline)
    for glyph in outline:
        if not glyph.name.startswith('Dev'):
            continue
        if len(glyph.contours) == 0:
            continue
        if len(glyph.components) > 0:
            print(f'both contours and components in {glyph.name}')
        glyph_location = '/glyphs/' + glyphname2filename(glyph.name) + '.glif'
        outline_glyph_location = f'{args.outline}{glyph_location}'
        dotted_glyph_location = f'{args.dotted}{glyph_location}'
        for glyph_location in (outline_glyph_location, dotted_glyph_location):
            if not os.path.exists(glyph_location):
                print(f'file does not exist {glyph_location}')
        cmd = f'MFEKstroke DASH -i {outline_glyph_location} -o {dotted_glyph_location} -c -W 80'
        os.system(cmd)


if __name__ == "__main__":
    main()
