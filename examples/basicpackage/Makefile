all: hello.html

hello.html: hello.tex config.cfg sample.sty sample.4ht
	make4ht -um draft -c config.cfg hello.tex
