#!/bin/python3
import sys
from PIL import Image

name = input()
img = Image.open(name + ".jpg", "r")
fig = img.convert("RGB")
# fig.save(name + '.eps', lossless=True)
fig.save(sys.stdout, "EPS", lossless=True)
