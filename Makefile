CLEAN_FILES :=

TEX_FILES := ops-manual.tex chapters/*.tex chapters/*/*.tex

# Files that the main document depends on, which aren't tex files
INC_FILES :=

include ./*/include.mk

ops-manual.pdf: $(TEX_FILES) $(INC_FILES)
	xelatex $(TEX_FILES)
	xelatex $(TEX_FILES)

.PHONY: clean

clean:
	-rm -f ops-manual.pdf
	-rm -f *.{log,aux,out}
	-rm -f chapters/*.{log,aux,out}
	-rm -f chapters/*/*.{log,aux,out}
	-rm -f $(CLEAN_FILES)

