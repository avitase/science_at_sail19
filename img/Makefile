.PHONY: all clean

pngs = lhcb_logo.png \
	   bmbf.png \
	   uni_logo.png \
	   physik_logo.png \
	   cern_logo.png \
	   me.png \
	   aristoteles.png \
	   newton.png \
	   einstein.png \
	   cascade.png \
	   taxis.png \
	   dust_fake.png \
	   dust_init.png \
	   dust_t1.png \
	   dust_t2.png \
	   dust_t3.png \
	   dali.png \
	   wu.png \
	   donkey.png \
	   anti_donkey.png \
	   nobelprize.png \
	   kafka.png \
	   cplear.png \
	   cplear_result.png \
	   ams02.png \
	   cup.png \
	   lhcb_collaboration.png \
	   cern_map.png \
	   lhcb_pit.png

all: $(pngs)

clean:
	rm -f $(pngs)
	cd gp/ && make clean
	cd sim/ && make clean

taxis.png: 
	cd gp/ && make

dust_%.png:
	cd sim/ && make

anti_%.png: %.png
	convert -flop $*.png $@

%.png: original/%.png
	convert $< -resize 1920x1080\> $@
