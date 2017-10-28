set terminal eps enhanced
set title "Cäsium Halbleiter"
set ylabel "Ereignisse"
set xlabel "Energie in keV"
set xrange [1:1500]

set output "caesium_hl_energie.eps"

#plot "daten_hl.txt" u (($1+22.7)/5.17):2:(sqrt((0.4/5.17)**2+(($1+22.7)*0.001/(5.17**2))**2)):(sqrt($2)) w xyerrorbars notitle
plot "daten_hl.txt" u (($1+22.7)/5.17):2 w lines notitle

set title "Cobalt Halbleiter"

set output "cobalt_hl_energie.eps"

plot "daten_hl.txt" u (($1+22.7)/5.17):3 w lines notitle

set title "Europium Halbleiter"

set output "europium_hl_energie.eps"

plot "daten_hl.txt" u (($1+22.7)/5.17):4 w lines notitle
