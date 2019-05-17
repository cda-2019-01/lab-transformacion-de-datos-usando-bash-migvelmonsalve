# Escriba su código aquí
for x in data*.csv 
do 
    sed -e 's/\t/\,/g' -e 's/   /,/g' ${x} > temp1.csv
    t=0
    for y in $(cat temp1.csv)
    do  
        t=$((t+1))
        q=${y:0:1}
        echo ${y} | sed "s/\,/;${q}\,/2g" > temp2.csv
        
            for z in $(sed "s/\;/ /g" temp2.csv)
            do 
                echo "${x},${t},${z}" >> resultado.csv
                     
            done
  
    done

done
rm temp*.csv
cat resultado.csv