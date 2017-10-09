# Note: this script runs pdflatex, bibtex, then pdflatex again because of how generating bibliographies works:

# Run LaTeX on your document. This creates a .aux file that BibTeX uses to look for references according to the “key”.
# Run BibTeX on your document. This creates a .bbl file that LaTeX uses to create your bibliography.
# Run LaTeX again to update the document with the reference list and all the right citations.

export PATH=$PATH:/Library/TeX/texbin
document=whitepaper
rm ${document}.pdf
pdflatex ${document}
biber ${document}
pdflatex ${document}
pdflatex ${document}
rm -f *.aux  *.blg  *.dvi  *.log *.lot *.lof *.toc *.gz *.bbl
# evince ${document}.pdf
# open ${document}.pdf
