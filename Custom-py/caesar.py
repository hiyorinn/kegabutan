#!/usr/bin/python2

import string
import sys

LOWERS = string.ascii_lowercase
UPPERS = string.ascii_uppercase
DIGITS = string.digits

def shifting(char, shift):
    if char in LOWERS:
        index = LOWERS
    elif char in UPPERS:
        index = UPPERS
    elif char in DIGITS:
        index = DIGITS
    else:
        return char

    pos = index.index(char) + shift
    return index[-(abs(pos) % len(index))] if pos < 0 \
        else index[pos % len(index)]

def encode(text, shift):
    return ''.join(shifting(_, shift) for _ in text)
        
def decode(text, shift):
    shift *= -1
    return ''.join(shifting(_, shift) for _ in text)

if __name__ == "__main__":
    stdin = sys.stdin.read()

    try:
        mode, shift = sys.argv[1:]
    except ValueError:
        mode = sys.argv[1]
        shift = 13
    finally:
        if mode == '-d':
            print decode(stdin, int(shift))
        elif mode == '-e':
            print encode(stdin, int(shift))
        elif mode == '-b':
            for enum in range(26):
                print '{:<2} {}'.format(enum, decode(stdin, enum)),
