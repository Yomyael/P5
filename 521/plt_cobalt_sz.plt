set terminal eps enhanced
set output 'cobalt_sz.eps'
set xrange [3000:5500]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Cobalt Szintillator'

set samples 10000

c(x) = c1*x+b1
b1 = 10
fit [5100:5500] c(x) 'daten_sz.txt' u 1:3:(sqrt($3)+0.001) yerror via c1,b1

g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2))+c(x)
m1 = 4995
a1 = 5000
s1 = 15
fit [4695:5295] g1(x) 'daten_sz.txt' u 1:3:(sqrt($3)+0.001) yerror via a1,s1,m1

g2(x) = a2/(sqrt(2*pi)*s2) * exp(-(x-m2)**2/(2*s2**2)) + c2*x + d2
m2 = 4400
a2 = 15000
s2 = 5
#c2 = 100
fit [4100:4700] g2(x) 'daten_sz.txt' u 1:3:(sqrt($3)) yerror via a2,s2,m2,c2,d2



set xrange [4100:5295]

plot 'daten_sz.txt' u 1:3:(sqrt($2)) w yerrorbars notitle, [4695:5295] g1(x), [4100:4700] g2(x)
