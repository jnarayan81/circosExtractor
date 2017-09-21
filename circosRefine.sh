#!/bin/bash
#Plot the specific chromosome/contigs/scaffolds/segment 
#Demonstrate how actually works ./circosRefine.sh

#USAGE: ./circosRefine.sh  scaffold_129 scaffold1265_size87431 
#Note there should be ribbon connection between two or more requested scaffolds -- see circos.sequences.txt file

scriptbase=./scripts
#NOTE: Original circos.segdup.txt circos.sequences.txt and circos.highlight.txt should be in backup folder
circosLoc=/home/urbe/Tools/circos-0.69-4/bin

for name1 in "$@"
do
 echo $name1
 grep -w $name1 circos.sequences.txt >> all.tmp
done

comm <(sort all.tmp) <(sort circos.sequences.txt) -3 > remain.tmp
perl $scriptbase/finePic.pl remain.tmp > all2.tmp

while read name
do
    echo $name
    perl $scriptbase/finePic2.pl circos.segdup.txt $name >> all3.tmp
done < all2.tmp

sort < all3.tmp | uniq > all4.tmp

perl $scriptbase/finePic3.pl all4.tmp circos.segdup.txt >> all5.tmp

mkdir backupRefine
mv *.txt backupRefine 

cp -rf all5.tmp circos.segdup.txt
cp -rf all.tmp circos.sequences.txt

rm -rf *.tmp

#Circos command
$circosLoc/circos -conf circos.conf


