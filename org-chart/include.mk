CLEAN_FILES += $(patsubst %.dot,%.pdf,$(wildcard org-chart/*.dot))
INC_FILES += $(patsubst %.dot,%.pdf,$(wildcard org-chart/*.dot))

org-chart/%.pdf: org-chart/%.dot
	dot $^ -Tpdf > $@
