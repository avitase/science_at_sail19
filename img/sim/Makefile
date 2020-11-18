IMGS = ../dust_fake.png \
       ../dust_init.png \
	   ../dust_t1.png \
	   ../dust_t2.png \
	   ../dust_t3.png

all: $(IMGS)

clean:
	rm -rf $(IMGS)
	find -iname "*.pyc" -delete

venv: venv/bin/activate

venv/bin/activate: requirements.txt
	test -d venv || virtualenv -p python3 venv
	. venv/bin/activate; pip install -Ur requirements.txt
	touch venv/bin/activate

../%.png: generate.py venv
	. venv/bin/activate; ./generate.py
	mv *.png ../
	
