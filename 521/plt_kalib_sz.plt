set terminal eps enhanced
set output 'kalib_sz.eps'
#set xrange [550:8000]
set xlabel 'Energie in keV'
set ylabel 'Kanäle'
set title 'Energiekalibrierung Szintillator'

g(x) = m*x + b
fit g(x) 'mittelwerte_sz.txt' u 3:1:2 yerror via m,b

plot 'mittelwerte_sz.txt' u 3:1:2 w yerrorbars notitle, g(x) notitle
