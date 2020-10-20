base=tex4ht_process
SOURCE=$(base).tex
PDF=$(base).pdf
SVG=$(base).svg


all: $(SOURCE) $(PDF) $(SVG)
$(PDF): $(SOURCE)
	pdflatex $<
	ebb -x $(PDF)

$(SVG): $(SOURCE)
	latex '\def\pfgsysdriver{pgfsys-dvisvgm.def}\input{$<}'
	dvisvgm  -o $(SVG) -c 1.5 --exact --font-format=woff,ah $(base).dvi

