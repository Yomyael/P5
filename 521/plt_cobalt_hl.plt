set terminal eps enhanced
set output 'cobalt_hl.eps'
set xrange [6000:6950]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Cobalt Halbleiterdetektor'

set samples 100000

g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2))
m1 = 6045
a1 = 15000
s1 = 5
fit [6025:6065] g1(x) 'daten_hl.txt' u 1:3:(sqrt($3)) yerror via a1,s1,m1

g2(x) = a2/(sqrt(2*pi)*s2) * exp(-(x-m2)**2/(2*s2**2))
m2 = 6870
a2 = 15000
s2 = 5
fit [6840:6900] g2(x) 'daten_hl.txt' u 1:3:(sqrt($3)) yerror via a2,s2,m2

plot 'daten_hl.txt' u 1:3:(sqrt($3)) w yerrorbars notitle, [6025:6065] g1(x), [6840:6900] g2(x)
