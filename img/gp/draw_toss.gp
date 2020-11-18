set terminal epslatex size 2.3, 2.1 monochrome standalone "" 9
set output 'toss.tex'

set xlabel 'Zeit $t$ [s]'
set ylabel 'Höhe $h$ [m]'

set xrange [0:2.1]
set yrange [0:]

g = 9.81
set arrow from first 10/g, graph 0 to first 10/g, graph 1 dt 2 nohead
set arrow from graph 0, first 50/g to graph 1, first 50/g dt 2 nohead

f(x) = 10*x - g/2. * x**2

plot f(x) notitle   
