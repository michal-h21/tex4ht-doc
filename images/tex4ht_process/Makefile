base=tex4ht_process
SOURCE=$(base).tex
PDF=$(base).pdf
SVG=$(base).svg


all: $(SOURCE) $(PDF) $(SVG)
$(PDF): $(SOURCE)
	pdflatex $<

$(SVG): $(SOURCE)
	latex '\def\pfgsysdriver{pgfsys-dvisvgm.def}\input{$<}'
	dvisvgm --exact --font-format=woff,ah $(base).dvi
