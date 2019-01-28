mode = draft
engine = 
outputdir = out

IMAGESUBDIRS := $(wildcard images/*/.)


ifeq (lualatex, lualatex)
	engine = -l
endif

ifeq (lualatex, xelatex)
	engine = -x
endif

# sections = sections/tex4ht-commands.tex sections/tex4ht-options.tex sections/webfonts.tex sections/configuration-files.tex sections/tex4ht-development.tex sections/calling-commands.tex sections/graphics.tex
sections = $(wildcard sections/*.tex)
filters = $(wildcard filters/*.lua)
	
all: $(IMAGESUBDIRS) tex4ht-doc.pdf tex4ht-doc.html 

$(IMAGESUBDIRS):
	$(MAKE) -C $@

.PHONY: final all $(IMAGESUBDIRS)

tex4ht-doc.pdf: tex4ht-doc.tex tex4ht-styles.sty ${sections}
	lualatex -shell-escape tex4ht-doc.tex

tex4ht-doc.html: tex4ht-doc.tex config.cfg tex4ht-styles.sty build.mk4 ${sections} ${filters}
	make4ht -usm $(mode) -c config $(engine) -d $(outputdir) -f html5+common_domfilters -e build.mk4  tex4ht-doc.tex


# use only one LaTeX run by default, request three compilations with final rule
final: tex4ht-doc.html 
	make4ht -usm final -c config $(engine) -d $(outputdir) -f html5+common_domfilters -e build.mk4  tex4ht-doc.tex

clean:
	rm *.html *.aux *.4tc *.4ct *.xref 
