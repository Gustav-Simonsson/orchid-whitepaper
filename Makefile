SHELL := /bin/bash
PATH  := $(PATH):/Library/TeX/texbin

whitepaper.pdf: whitepaper.tex draft.tex whitepaper.bib
	rm -f whitepaper.pdf
	pdflatex whitepaper
	biber whitepaper
	pdflatex whitepaper
	pdflatex whitepaper

clean: FORCE
	rm -rf `find . -name "*.aux" -o -name "*.blg" -o -name "*.dvi" -o -name "*.log" -o -name "*.lot" -o -name "*.lof" -o -name "*.toc" -o -name "*.bbl" -o -name "*.bcf" -o -name "*.run/xml"`

distclean: clean
	rm -f whitepaper.pdf

FORCE:
