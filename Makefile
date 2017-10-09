
export PATH := $(PATH):/Library/TeX/texbin

whitepaper.pdf: whitepaper.tex draft.tex whitepaper.bib
	rm -f whitepaper.pdf
	pdflatex whitepaper
	biber whitepaper
	pdflatex whitepaper
	pdflatex whitepaper
	rm -f *.aux  *.blg  *.dvi  *.log *.lot *.lof *.toc *.gz *.bbl

clean: FORCE
	rm -f *.aux  *.blg  *.dvi  *.log *.lot *.lof *.toc *.gz *.bbl

distclean: clean
	rm -f whitepaper.pdf

FORCE:
