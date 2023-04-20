#!/usr/bin/python3

from fontParts.world import *
from palaso.unicode.ucd import get_ucd
import toml
import argparse


def main():
    parser = argparse.ArgumentParser(description='Add non-ABS digits to an ABS font')
    parser.add_argument('-c', '--config', help='configuration file to use')
    parser.add_argument('abs', help='ABS font to add to')
    parser.add_argument('pub', help='Primary font for publishing')
    parser.add_argument('--version', action='version', version='%(prog)s 0.1')
    args = parser.parse_args()

    config_file = 'digits.toml'
    if args.config:
        config_file = args.config
    config = toml.load(config_file)

    # Open UFO
    abs = OpenFont(args.abs)
    pub = OpenFont(args.pub)

    transfer(config, abs, pub)

    # Save UFO
    abs.changed()
    abs.save()
    abs.close()


def transfer(config, abs, pub):

    # Find digits in the main publishing font
    zero = config['zero']
    pub_digits = find_names(pub, zero)
    pub_width = find_width(pub, pub_digits)

    # Scaling
    scale_upm = 1
    abs_upm = abs.info.unitsPerEm
    pub_upm = pub.info.unitsPerEm

    # If the UPMs of the two fonts are different...
    if abs_upm != pub_upm:
        # ...the glyph size needs to be changed.
        scale_upm = abs_upm / pub_upm

        # ...the width values must be normalized before comparing them.
        pub_width *= scale_upm

    # Find encoded zeros in the ABS font
    zeros = list()
    for glyph in abs:
        if glyph.unicode is None:
            continue
        if get_ucd(glyph.unicode, 'gc') == 'Nd':
            if get_ucd(glyph.unicode, 'nv') == '0':
                zeros.append(glyph.name)

    # Find sizes
    sizes = set()
    for glyph in abs:
        for zero in zeros:
            if glyph.name == zero or glyph.name.startswith(f'{zero}.'):
                glyph_name, dot_name, size = glyph.name.partition('.')
                sizes.add(size)

    # Find all digits in the ABS font and transfer the ink from the publishing font
    for zero in zeros:
        abs_base_digits = find_names(abs, abs[zero].unicode)
        for size in sizes:
            suffix = ''
            if size != '':
                suffix = f'.{size}'
            abs_digits = [abs_digit + suffix for abs_digit in abs_base_digits]
            abs_width = find_width(abs, abs_digits)

            # Scale needed for the publishing font digits to match the width of the ABS digits
            scale_width = abs_width / pub_width

            for pub_digit, abs_digit in zip(pub_digits, abs_digits):
                abs_glyph = abs[abs_digit]
                pub_glyph = pub[pub_digit]
                # print(f'{pub_glyph.name} to {abs_glyph.name}')

                # Remove ink from the digits in the ABS font (leaving the anchors)
                for contour in abs_glyph.contours:
                    abs_glyph.removeContour(contour)

                # Transfer ink for the digit
                for contour in pub_glyph.contours:
                    ink = contour.copy()
                    ink.scaleBy(scale_upm * scale_width)
                    abs_glyph.appendContour(ink)


def find_names(font, zero):
    names = list()
    for digit in range(zero, zero + 10):
        for glyph in font:
            if glyph.unicode == digit:
                names.append(glyph.name)
    return names


def find_width(font, names):
    max_width = 0
    for name in names:
        glyph = font[name]
        width = glyph.width
        max_width = max(max_width, width)
    return max_width


if __name__ == "__main__":
    main()
