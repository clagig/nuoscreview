LATEX    = latex
BIBTEX   = bibtex
DVIPS    = dvips

default: NuOscV

NuOscV:
	pdflatex nuoscreview
	bibtex nuoscreview.aux
	pdflatex nuoscreview
	
#
# standard Latex targets
#

%.dvi:	%.tex 
	$(LATEX) $<

%.bbl:	%.tex *.bib
	$(LATEX) $*
	$(BIBTEX) $*

%.ps:	%.dvi
	$(DVIPS) $< -o $@

%.pdf:	%.tex
	$(PDFLATEX) $<

.PHONY: clean

clean:
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
	      *.inx *.dvi *.toc *.out *~ ~* spellTmp 

binclean:
	rm -f ${BASENAME}.pdf
