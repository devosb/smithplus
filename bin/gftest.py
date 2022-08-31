#!/usr/bin/python3

from thefoxUtils import unikey
import os.path
import glob
import argparse


def main():
    parser = argparse.ArgumentParser(description='Tests to markdown for Google Fonts')
    # parser.add_argument('file', help='Test files to process', nargs='+')
    parser.add_argument('--version', action='version', version='%(prog)s ' + '0.1')
    args = parser.parse_args()

    font_services = ['lpr', 'gf', 'flo']
    test_filenames = glob.glob('*.*')
    for test_filename in test_filenames:
        # Construct output filename
        (base_filename, ext) = os.path.splitext(test_filename)

        text = ''
        if ext == '.txt':
            with open(test_filename) as test_file:
                text = test_file.read()
        with open(f'../dev/{base_filename}.md', 'w') as markdown_file:
            markdown_file.write('Source | Sample' + '\n')
            markdown_file.write('- | -------------------------' + '\n')
            for font_service in font_services:
                markdown_file.write(f"{font_service} | <span class='{font_service}'>{text}</span>\n")


if __name__ == "__main__":
    main()
