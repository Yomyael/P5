set terminal eps enhanced
set output 'fwhm_hl.eps'
set xlabel 'Quadrat der Halbwertsbreite'
set ylabel 'Photonenenergie'
set title 'Bestimmung der intrinsischen Halbwertsbreite'

g(x) = m*x + b
fit g(x) 'fwhm_hl.txt' u 3:1:4:2 xyerror via m,b

plot 'fwhm_hl.txt' u 3:1:4:2 w xyerrorbars notitle, g(x) notitle
