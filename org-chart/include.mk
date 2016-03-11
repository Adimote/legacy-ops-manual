CLEAN_FILES += $(patsubst %.dot,%.pdf,$(wildcard org-chart/*.dot))
INC_FILES += $(patsubst %.dot,%.pdf,$(wildcard org-chart/*.dot))

MKFILE_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
CLEAN_FILES += roles.csv
INC_FILES += roles.csv
ROLE_DOT_FILES = $(MKFILE_PATH)top.dot $(MKFILE_PATH)comp-prog.dot $(MKFILE_PATH)comp-event.dot

roles.csv: $(ROLE_DOT_FILES)
	$(MKFILE_PATH)gen_role_csv.py $^ > $@

org-chart/%.pdf: org-chart/%.dot
	dot $^ -Tpdf > $@

org-chart/comp-event.pdf: org-chart/comp-event.dot
	unflatten -l 3 $^ | dot -Tpdf > $@
