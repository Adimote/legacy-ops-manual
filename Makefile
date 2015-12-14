
ops-manual.pdf: ops-manual.tex chapters/*.tex
	xelatex $^

.PHONY: clean

clean:
	-rm -f 
