set terminal eps enhanced
set output "rel_eff.eps"
set title "Relative Effizienz"
set xlabel "Energie in keV"
set ylabel "Relative Effizienz"
#set grid

#f(x) = a/(x-b)**d + c

#fit f(x) "rel_eff.txt" u 1:2:3 yerror via a,b,c,d


plot "rel_eff.txt" u 1:2:3 w yerrorbars notitle#, f(x) title "Fit", "rel_eff.txt" u 1:($2-f($1)) title "Residuum"
