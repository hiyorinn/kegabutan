#!/usr/bin/python2

from argparse import ArgumentParser
import sys

def str2oct(text):
    return ''.join(map(lambda x : "{0:o}".format(ord(x)).zfill(3), text))

def oct2str(text):
    res = ''
    for _ in text.split():
        for __ in range(0, len(_), 3):
            try:
                res += chr(int(_[__:__+3],8))
            except ValueError:
                pass
    return res

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument('--decode', '-d', help='Decode mode', action='store_true')

    arg = parser.parse_args()
    if arg.decode:
        print oct2str(sys.stdin.read()),
    else:
        print str2oct(sys.stdin.read()),
