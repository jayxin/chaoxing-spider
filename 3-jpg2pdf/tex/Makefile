main.pdf: main.tex pages.tex
	echo>pages.tex
	bash generate.sh
	mkdir -p out
	xelatex -output-directory out main.tex
