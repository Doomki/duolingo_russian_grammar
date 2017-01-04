FILES=htmlfiles/*.html

for f in $FILES
do
    filename="${f%.*}"
    filename="${filename/htmlfiles\//}"

    #echo "Converting $f to $filename.tex"
    `pandoc $f -o texfiles/$filename.tex`
done
sed -i -- 's/section/chapter/g' texfiles/*.tex
sed -i -- 's/subsubchapter/section/g' texfiles/*.tex

sed -i --  "s/▲/\$ \\\blacktriangle\$/g" texfiles/*.tex
sed -i -- "s/▼/\$ \\\blacktriangledown\$/g" texfiles/*.tex
sed -i -- "s/→/$ \\\rightarrow$/g" texfiles/*.tex
sed -i -- "s/←/$ \\\leftarrow$/g" texfiles/*.tex
sed -i -- "s/⁰/\$^0\$/g" texfiles/*.tex
sed -i -- "s/¹/\$^1\$/g" texfiles/*.tex
sed -i -- "s/²/\$^2\$/g" texfiles/*.tex
sed -i -- "s/³/\$^3\$/g" texfiles/*.tex
sed -i -- "s/⁴/\$^4\$/g" texfiles/*.tex
sed -i -- "s/⁵/\$^5\$/g" texfiles/*.tex
sed -i -- "s/\xCE\x9B/\$ \\\Lambda\$/g" texfiles/*.tex
sed -i -- "s/\xCA\xB2/\$^j\$/g" texfiles/*.tex
sed -i -- "s/\xE1\xB5\x89/\$^e\$/g" texfiles/*.tex
sed -i -- "s/\xE3\x80\x80/ /g" texfiles/*.tex
sed -i -- "s/\xE2\x87\x86/$ \\\rightleftharpoons$/g" texfiles/*.tex
sed -i -- "s/↝/$ \\\leadsto\$/g" texfiles/*.tex
sed -i -- "s/↶/$ \\\curvearrowleft$/g" texfiles/*.tex
sed -i -- "s/↺/$ \\\circlearrowleft$/g" texfiles/*.tex
sed -i -- "s/\xC9\xA3/\$ \\\gamma\$/g" texfiles/*.tex
sed -i -- "s/\xE2\x88\x85/\\\o/g" texfiles/*.tex
sed -i -- "s/\(.\)\xcc\x81/\\\\'{\1}/g" texfiles/*.tex
sed -i -- "s/\(.\)\xcd\x83/\\\\'{\1}/g" texfiles/*.tex
sed -i -- "s/\(.\)\xcc\x92/\\\`{\1}/g" texfiles/*.tex

count=`ls htmlfiles/*.html 2>/dev/null | wc -l`
count=`expr $count - 1`

if [ $count > -1 ]
then
    output=""
    for i in `seq 0 $count` ; do
        output+="\\include{texfiles/lesson$i}\n"
        
    done

    echo -e $output
fi

rm ./-1
