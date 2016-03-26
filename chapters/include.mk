INC_FILES += chapters/authors.tex chapters/by-sa.pdf
CLEAN_FILES += chapters/authors.tex

chapters/authors.tex: chapters/mkauthors .git_commit
	chapters/mkauthors > $@

chapters/by-sa.pdf: chapters/by-sa.svg
	inkscape -D -z --file=$< --export-pdf=$@
