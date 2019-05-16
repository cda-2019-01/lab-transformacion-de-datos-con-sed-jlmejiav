#
for row in $(cat out.4) ; do if (($($row: -1)==\;)) ;then $($row: -1)=;\N ;fi; done > out.5