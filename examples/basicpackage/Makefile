all: hello.html hello.pdf

hello.html: hello.tex config.cfg sample.sty sample.4ht
	make4ht -um draft -c config.cfg hello.tex

hello.pdf: hello.tex
	lualatex -jobname hello '\RequirePackage{../pdfstyles}\input{$<}'
