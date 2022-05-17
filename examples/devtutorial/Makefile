all: sample.pdf sample.html

sample.html: sample.tex config.cfg mynote.4ht mynote.sty
	make4ht -um draft -c config.cfg $<

sample.pdf: sample.tex config.cfg mynote.4ht mynote.sty
	lualatex -jobname hello '\RequirePackage{../pdfstyles}\input{$<}'
