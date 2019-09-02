#!/usr/bin/env bash
pdflatex --interaction=batchmode main
bibtex main
makeglossaries main
pdflatex --interaction=batchmode main
pdflatex --interaction=batchmode main
xdg-open main.pdf
