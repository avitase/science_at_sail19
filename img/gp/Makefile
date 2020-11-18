IMGS = ../taxis.png ../toss.png

.PHONY: all clean

all: $(IMGS)

clean:
	rm -rf $(IMGS)

../taxis.png: draw_taxis.gp ./gp2png.sh
	./gp2png.sh draw_taxis.gp taxis.tex monochrome
	mv taxis.png ../

../toss.png: draw_toss.gp ./gp2png.sh
	./gp2png.sh draw_toss.gp toss.tex monochrome
	mv toss.png ../
