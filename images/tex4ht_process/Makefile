base=tex4ht_process
SOURCE=$(base).tex
PDF=$(base).pdf
SVG=$(base)-1.svg


all: $(SOURCE) $(PDF) $(SVG)
$(PDF): $(SOURCE)
	pdflatex $<

$(SVG): $(SOURCE)
	latex '\def\pfgsysdriver{pgfsys-dvisvgm.def}\input{$<}'
	dvisvgm -c 1.5 --exact --font-format=woff,ah $(base).dvi
