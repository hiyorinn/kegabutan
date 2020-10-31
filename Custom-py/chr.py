#!/usr/bin/python2
import sys

def dec2str(seq):
    res = ''
    for _ in seq.split():
        try:
            res += chr(int(_))
        except: print("JANCUUUK")
    return res

if __name__ == "__main__":
    seq = sys.stdin.read()
    print dec2str(seq)
