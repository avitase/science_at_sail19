all: slides.pdf 

.PHONY: clean build/main.pdf

clean:
	rm -f build/*

build/:
	mkdir -p build/

build/main.pdf: main.tex  build/
	cd img/ && make
	lualatex -interaction=nonstopmode -halt-on-error --shell-escape --output-directory=build $^

slides.pdf: build/main.pdf
	cp build/main.pdf slides.pdf
