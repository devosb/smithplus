#!/usr/bin/python3

from xml.etree.ElementTree import ElementTree
import os.path
import argparse


def main():
    parser = argparse.ArgumentParser(description='Extract text from FTML files')
    parser.add_argument('file', help='FTML files to process', nargs='+')
    parser.add_argument('--version', action='version', version='%(prog)s ' + '0.1')
    args = parser.parse_args()

    extract_text(args)


def extract_text(args):

    for ftml_filename in args.file:
        # Construct output filename
        (text_filename, ext) = os.path.splitext(ftml_filename)
        text_filename += '.txt'

        # Read FTML file
        ftml = ElementTree()
        ftml.parse(ftml_filename)

        # Extract text from FTML file to text file
        with open(text_filename, 'w') as text_file:
            for testgroup in ftml.iter('testgroup'):
                text_file.write('# ' + testgroup.get('label') + '\n')
                for test in testgroup.iter('test'):
                    text_file.write(test.get('label') + '\n')
                    for string in test.iter('string'):
                        text_file.write(string.text + '\n')


if __name__ == "__main__":
    main()
