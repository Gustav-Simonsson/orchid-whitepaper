SHELL := /bin/bash
PATH  := $(PATH):/Library/TeX/texbin

TEX_SOURCES = $(wildcard *.tex) $(wildcard */*.tex)
BIB_SOURCES = $(wildcard *.bib) $(wildcard */*.bib)

whitepaper.pdf: $(TEX_SOURCES) $(BIB_SOURCES)
	rm -f whitepaper.pdf
	pdflatex whitepaper
	biber whitepaper
	pdflatex whitepaper
	pdflatex whitepaper

draftpaper.pdf: $(TEX_SOURCES) $(BIB_SOURCES)
	rm -f draftpaper.pdf
	pdflatex draftpaper
	biber draftpaper
	pdflatex draftpaper
	pdflatex draftpaper

draft: draftpaper.pdf

clean: FORCE
	rm -rf `find . -name "*.aux" -o -name "*.blg" -o -name "*.dvi" -o -name "*.log" -o -name "*.lot" -o -name "*.lof" -o -name "*.toc" -o -name "*.bbl" -o -name "*.bcf" -o -name "*.run/xml"`

distclean: clean
	rm -f whitepaper.pdf

FORCE:
