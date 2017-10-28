set terminal eps enhanced
set output 'europium_sz.eps'
set xrange [0:1700]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Europium Szintillator'

set samples 100000

g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2)) + c1
m1 = 142
a1 = 5000
fit [82:202] g1(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via a1,s1,m1,c1

c2(x) = e2*x+f2
fit [800:880] c2(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via e2,f2

g2(x) = a2/(sqrt(2*pi)*s2) * exp(-(x-m2)**2/(2*s2**2)) + c2(x)
m2 = 945
a2 = 4000
s2 = 5
fit [895:995] g2(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via a2,s2,m2

c3(x) = e3*x+f3
fit [1100:1205] c3(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via e3,f3

g3(x) = a3/(sqrt(2*pi)*s3) * exp(-(x-m3)**2/(2*s3**2)) + c3(x)
m3 = 1325
a3 = 9000
s3 = 5
fit [1205:1445] g3(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via a3,s3,m3

g4(x) = a4/(sqrt(2*pi)*s4) * exp(-(x-m4)**2/(2*s4**2)) + c4
m4 = 3640
a4 = 9000
s4 = 5
c4 = 30
fit [3440:3840] g4(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via a4,s4,m4,c4

g5(x) = a5/(sqrt(2*pi)*s5) * exp(-(x-m5)**2/(2*s5**2)) + c5
m5 = 4130
a5 = 9000
s5 = 5
c5 = 30
fit [3900:4360] g5(x) 'daten_sz.txt' u 1:4:(sqrt($4)) yerror via a5,s5,m5,c5


plot 'daten_sz.txt' u 1:4 notitle, [82:202] g1(x), [895:995] g2(x), [1205:1445] g3(x), [3440:3840] g4(x), [3900:4360] g5(x), [2800:3100] g6(x)
