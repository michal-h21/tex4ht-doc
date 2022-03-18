
all: basic.html babel.html babel-lua.html

basic.html: basic.tex
	make4ht -m draft $<

babel.html: babel.tex
	make4ht -m draft $<

babel-lua.html: babel.tex
	make4ht -lm draft -j babel-lua $<
