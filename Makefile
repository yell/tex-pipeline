LATEX = latexmk
FLAGS = -pdf -silent
CLEAN_EGREP = '\.(acn|acr|alg|aux|aux.bak|bbl|bcf|blg|dvi|fdb_latexmk|fls|idx|idx.bak|ilg|ind|ist|lof|log|lol|lot|nav|out|ps|pdf|slg|slo|sls|snm|syg|syi|synctex.gz|tdo|toc|vrb)'
PDF_OPENER = xdg-open
MAIN_FILES = main beamer

all: build

build: $(MAIN_FILES:=.pdf)

%: %.pdf
	$(PDF_OPENER) $< 2>/dev/null

%.pdf: %.tex
	$(LATEX) $(FLAGS) $<

clean:
	find . -not -path './.git/*' -maxdepth 1 -type f | egrep $(CLEAN_EGREP) | xargs rm
	# latexmk -c
	# latexmk -C

.PHONY: all build clean
