jobname=sample
texsource=$(jobname).tex
pdffile=$(jobname).pdf
htmlfile=$(jobname).html

all: $(pdffile) $(htmlfile)

$(htmlfile): $(texsource)
	make4ht -c mycfg.cfg -m draft $<

$(pdffile): $(texsource)
	lualatex -jobname $(jobname) '\RequirePackage{../pdfstyles}\input{$<}'
