CLEAN_FILES :=

TEX_FILES := ops-manual.tex role-defs.tex chapters/*.tex chapters/*/*.tex appendices/*.tex

# Files that the main document depends on, which aren't tex files
INC_FILES := role.sty

include ./*/include.mk

ops-manual.pdf: $(TEX_FILES) $(INC_FILES)
	xelatex ops-manual.tex
	xelatex ops-manual.tex

.PHONY: clean

clean:
	-rm -f ops-manual.pdf
	-rm -f *.{log,aux,out}
	-rm -f chapters/*.{log,aux,out}
	-rm -f chapters/*/*.{log,aux,out}
	-rm -f appendices/*.{log,aux,out}
	-rm -f $(CLEAN_FILES)

