clear:
	rm -f mainfiles/*.aux
	rm -f diploma.aux diploma.bbl diploma.blg diploma.toc diploma.log diploma.out

tex:
	pdflatex -interaction=nonstopmode diploma.tex
	bibtex diploma
	pdflatex -interaction=nonstopmode diploma.tex
	pdflatex -interaction=nonstopmode diploma.tex