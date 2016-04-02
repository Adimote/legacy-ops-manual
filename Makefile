CLEAN_FILES :=

TEX_FILES := ops-manual.tex version.tex chapters/*.tex	\
	chapters/*/*.tex appendices/*.tex

# Files that the main document depends on, which aren't tex files
INC_FILES := role.sty

all: ops-manual.pdf

### Store the git commit hash in a file, so things can be rebuilt if
### it changes
GIT_COMMIT := $(shell git rev-parse --verify HEAD)

.git_commit: force
	@echo $(GIT_COMMIT) | cmp -s - $@ || echo $(GIT_COMMIT) > $@

CLEAN_FILES += .git_commit

### Store the release version in a file
GIT_DESCRIPTION := $(shell ./version)

version.tex: force
	@echo $(GIT_DESCRIPTION) | cmp -s - $@ || echo $(GIT_DESCRIPTION) > $@

include ./*/include.mk

ops-manual.pdf: $(TEX_FILES) $(INC_FILES)
	xelatex ops-manual.tex
	xelatex ops-manual.tex

.PHONY: clean force

clean:
	-rm -f ops-manual.pdf
	-rm -f *.{log,aux,out}
	-rm -f chapters/*.{log,aux,out}
	-rm -f chapters/*/*.{log,aux,out}
	-rm -f appendices/*.{log,aux,out}
	-rm -f $(CLEAN_FILES)

