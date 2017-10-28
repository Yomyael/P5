set terminal eps enhanced
set output 'caesium_sz.eps'
set xrange [2000:3000]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Caesium Szintillator'

set samples 10000

c(x) = c1*x+b1
fit [2000:2200] c(x) 'daten_sz.txt' u 1:2:(sqrt($2)) yerror via c1,b1

g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2))+c(x)
m1 = 2515
a1 = 30000
fit [2215:2815] g1(x) 'daten_sz.txt' u 1:2:(sqrt($2)) yerror via a1,s1,m1

plot 'daten_sz.txt' u 1:2:(sqrt($2)) w yerrorbars notitle, g1(x)
