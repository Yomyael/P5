set terminal eps enhanced
set output 'rueck_caesium_hl.eps'
set xrange [800:1800]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Zählrate Rückstreupeak'


g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2)) + c
m1 = 940
a1 = 1500
c = 300
#s = 10
fit [890:990] g1(x) 'daten_hl.txt' u 1:2:(sqrt($2)) yerror via a1,s1,m1,c

plot 'daten_hl.txt' u 1:2:(sqrt($2)) w yerrorbars notitle lt 7, [890:990] g1(x) lt 8 lw 2
