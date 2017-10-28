set terminal eps enhanced
set output 'europium_hl.eps'
set xrange [0:8000]
set ylabel 'Ereignisse'
set xlabel 'Kanäle'
set title 'Europium Halbleiterdetektor'

set samples 100000

g1(x) = a1/(sqrt(2*pi)*s1) * exp(-(x-m1)**2/(2*s1**2)) + c1*x
m1 = 610
a1 = 75000
fit [590:630] g1(x) 'daten_hl.txt' u 1:4:(sqrt($4)) yerror via a1,s1,m1,c1

g2(x) = a2/(sqrt(2*pi)*s2) * exp(-(x-m2)**2/(2*s2**2)) + c2*x
m2 = 1240
a2 = 4000
fit [1220:1260] g2(x) 'daten_hl.txt' u 1:4:(sqrt($4)) yerror via a2,s2,m2,c2

g3(x) = a3/(sqrt(2*pi)*s3) * exp(-(x-m3)**2/(2*s3**2)) + c3
m3 = 1760
a3 = 9000
s3 = 5
fit [1740:1780] g3(x) 'daten_hl.txt' u 1:4:(sqrt($4)) yerror via a3,s3,m3,c3

g4(x) = a4/(sqrt(2*pi)*s4) * exp(-(x-m4)**2/(2*s4**2)) + c4*x
m4 = 4005
a4 = 2000
fit [3985:4025] g4(x) 'daten_hl.txt' u 1:4:(sqrt($4)) yerror via a4,s4,m4,c4

g5(x) = a5/(sqrt(2*pi)*s5) * exp(-(x-m5)**2/(2*s5**2)) + c5
m5 = 4965
a5 = 2000
s5 = 5
fit [4945:4985] g5(x) 'daten_hl.txt' u 1:4:(sqrt($4)) yerror via a5,s5,m5,c5

g6(x) = a6/(sqrt(2*pi)*s6) * exp(-(x-m6)**2/(2*s6**2)) + c6
m6 = 5730
a6 = 2000
s6 = 5
fit [5710:5750] g6(x) 'daten_hl.txt' u 1:4:(sqrt($4)) yerror via a6,s6,m6,c6

g7(x) = a7/(sqrt(2*pi)*s7) * exp(-(x-m7)**2/(2*s7**2)) + c7
m7 = 7265
a7 = 50000
s7 = 5
fit [7255:7275] g7(x) 'daten_hl.txt' u 1:4:(sqrt($4)+0.001) yerror via a7,s7,m7,c7

g8(x) = a8/(sqrt(2*pi)*s8) * exp(-(x-m8)**2/(2*s8**2)) + c8
m8 = 2105
a8 = 1000
s8 = 2
c8 = 75
fit [2095:2115] g8(x) 'daten_hl.txt' u 1:4:(sqrt($4)+0.001) yerror via a8,s8,m8,c8

g9(x) = a9/(sqrt(2*pi)*s9) * exp(-(x-m9)**2/(2*s9**2)) + c9
m9 = 2275
a9 = 1500
s9 = 2
c9 = 75
fit [2255:2295] g9(x) 'daten_hl.txt' u 1:4:(sqrt($4)+0.001) yerror via a9,s9,m9,c9

g10(x) = a10/(sqrt(2*pi)*s10) * exp(-(x-m10)**2/(2*s10**2)) + c10
m10 = 2505
a10 = 500
s10 = 2.5
c10 = 75
fit [2485:2525] g10(x) 'daten_hl.txt' u 1:4:(sqrt($4)+0.001) yerror via a10,s10,m10,c10

g11(x) = a11/(sqrt(2*pi)*s11) * exp(-(x-m11)**2/(2*s11**2)) + c11
m11 = 5590
a11 = 2000
s11 = 5
fit [5575:5605] g11(x) 'daten_hl.txt' u 1:4:(sqrt($4)+0.001) yerror via a11,s11,m11,c11

#g12(x) = a12/(sqrt(2*pi)*s12) * exp(-(x-m12)**2/(2*s12**2))
#m12 = 5615
#a12 = 700
#s12 = 4
#fit [5605:5625] g12(x) 'daten_hl.txt' u 1:4:(sqrt($4)+0.001) yerror via a12,s12,m12

#set xrange [2200:2800]
set nokey

#set logscale y
#set yrange [1:]
set xrange[2050:2350]
plot 'daten_hl.txt' u 1:4 notitle, [590:630] g1(x), [1220:1260] g2(x), [1740:1820] g3(x), [3975:4035] g4(x), [4945:4985] g5(x), [5710:5750] g6(x), [7240:7280] g7(x), [2085:2125] g8(x), [2255:2295] g9(x), [2485:2525] g10(x), [5560:5620] g11(x)
