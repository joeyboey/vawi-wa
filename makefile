DOC = main
LATEX = latexmk --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf
PDF = pdflatex --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error
BIB = biber

all:
	@$(LATEX) $(DOC) ||:
	$(BIB) $(DOC)
	$(PDF) $(DOC)
	$(PDF) $(DOC)

clean:
	latexmk -c
	git clean -fX