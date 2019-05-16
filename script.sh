# Escriba su código aquí
#Modificar formato de fechas mal puestas
sed 's#\([0-9]\)/\([0-9]\)/[0-9][0-9]\([0-9][0-9]\)#0\1/0\2/\3#' data.csv> out.1
#Cambiar formato fecha a YYYY-MM-DD
sed 's#\([0-9][0-9]\)/\([0-9][0-9]\)/\([0-9][0-9]\)#20\3-\2-\1#' out.1 > out.2
#Cambiar minúsculas a mayúsculas
tr '[:lower:]'  '[:upper:]'< out.2 > out.3
#Cambiar vacíos por \N que no están al final
sed 's#;;#;\\N;#' out.3 > out.4
#Cambiar vacíos del final 
sed 's/;$/;\\N/' out.4 > out.5
#punto para decimales
sed 's#,#.#g' out.5 > out.6
#Punto y coma cambiado por comas
sed 's#;#,#g' out.6 > out.7
#Cambiar N por \N
sed 's/,N/,\\N/g' out.7 > out.8
cat out.8
rm out.*