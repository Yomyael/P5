set terminal eps enhanced
set output 'rueck_cobalt_sz.eps'
set xrange [600:3000]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Cobalt Szintillator'


g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2))+c1
m1 = 2485
a1 = 5000
s1 = 15
fit [2285:2685] g1(x) 'daten_sz.txt' u 1:3:(sqrt($3)) yerror via a1,s1,m1,c1

g2(x) = a2/(sqrt(2*pi)*s2) * exp(-(x-m2)**2/(2*s2**2)) + c2*x + d2
m2 = 850
a2 = 15000
s2 = 5
c2 = 300
fit [600:1100] g2(x) 'daten_sz.txt' u 1:3:(sqrt($3)) yerror via a2,s2,m2,c2,d2


plot 'daten_sz.txt' u 1:3:(sqrt($2)) w yerrorbars notitle, [2285:2685] g1(x), [600:1100] g2(x)
