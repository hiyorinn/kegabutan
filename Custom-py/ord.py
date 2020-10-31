#!/usr/bin/python2
import sys

def str2dec(text):
    res = []
    for _ in text:
        try:
            res += [str(ord(_))]
        except: pass
    return ' '.join(res)

if __name__ == "__main__":
    text = sys.stdin.read()
    print str2dec(text)
