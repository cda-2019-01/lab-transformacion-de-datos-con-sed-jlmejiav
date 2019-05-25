# Escriba su código aquí
#Modificar formato de fechas mal puestas
sed 's#\([0-9]\)/\([0-9]\)/[0-9][0-9]\([0-9][0-9]\)#0\1/0\2/\3#' data.csv> out.1
#Cambiar formato fecha a YYYY-MM-DD
sed 's#\([0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\)#20\3-\2-\1#' out.1 > out.2
#Cambiar minúsculas a mayúsculas
tr '[:lower:]'  '[:upper:]'< out.2 > out.3
#Cambiar vacíos por \N que no están al final
sed 's#;;#;\\N;#' out.3 > out.4
# Ponerle \N manual a las que faltan al final
sed 's/\(2013-06-21;\\N;\\N;\)/\1\\N/' out.4 | sed 's/\(2014-05-12;C;\\N;\)/\1\\N/' > out.5
#punto para decimales
sed 's#,#.#g' out.5 > out.6
#Punto y coma cambiado por comas
sed 's#;#,#g' out.6 > out.7
#Cambiar N por \N
sed 's/,N/,\\N/g' out.7 > out.8
cat out.8
rm out.*
#
#####
###Cambiar vacíos del final
# sed 's/;$/\\N/' out.4 > out.5
## Agregar una lista con un símbolo único
# seq -f'+%g' 12 > out.aux
##pegar lista de síbolo único con la de trabajo
# paste out.4 out.aux > out.pega
# for a in $(cat out.4)
# do
#     echo $a >> out.lista
# done 
# sed 's/;$/\\N/' out.lista > out.5
#####