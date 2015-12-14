
ops-manual.pdf: ops-manual.tex chapters/*.tex
	xelatex $^
	xelatex $^


.PHONY: clean

clean:
	-rm -f ops-manual.pdf
	-rm -f *.{log,aux,out}
	-rm -f chapters/*.{log,aux,out}

