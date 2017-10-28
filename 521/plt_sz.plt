set terminal eps enhanced
set title "Cäsium Szintillator"
set ylabel "Ereignisse"
set xlabel "Energie in keV"
set xrange [1:1500]

set output "caesium_sz_energie.eps"

#plot "daten_sz.txt" u (($1-46)/3.7):2:(sqrt((0.4/5.17)**2+(($1+22.7)*0.001/(5.17**2))**2)):(sqrt($2)) w xyerrorbars notitle
plot "daten_sz.txt" u (($1-46)/3.7):2 w lines notitle

set title "Cobalt Szintillator"

set output "cobalt_sz_energie.eps"

plot "daten_sz.txt" u (($1-46)/3.7):3 w lines notitle

set title "Europium Szintillator"

set output "europium_sz_energie.eps"

plot "daten_sz.txt" u (($1-46)/3.7):4 w lines notitle
