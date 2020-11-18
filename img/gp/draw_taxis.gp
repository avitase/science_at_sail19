set terminal epslatex size 2.8, 2.1 monochrome standalone "" 9
set output 'taxis.tex'

set mxtics

set xrange [0:.5]


set xlabel 'Zeit $t$'
set ylabel 'Geschwindigkeit $v$'

f(x) = sin(x * 4) / (x**2 + 1)

t1 = .1
t2 = .2

set arrow from t1, 0 to t1, f(t1) head filled size screen 0.03,15,45 ls 1 lw 2 dt 4
set arrow from t2, 0 to t2, f(t2) head filled size screen 0.03,15,45 ls 1 lw 2 dt 4

set label '$t_1$' right at t1-.01, .1
set label '$t_2$' at t2+.01, .2

plot f(x) notitle
