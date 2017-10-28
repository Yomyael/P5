set terminal eps enhanced
set output 'rueck_caesium_sz.eps'
set xrange [0:1800]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Zählrate Rückstreupeak'


g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2)) + c
m1 = 745
a1 = 2500
c = 450
s = 10
fit [665:825] g1(x) 'daten_sz.txt' u 1:2:(sqrt($2)) yerror via a1,s1,m1,c

plot 'daten_sz.txt' u 1:2:(sqrt($2)) w yerrorbars notitle, [645:845] g1(x)
