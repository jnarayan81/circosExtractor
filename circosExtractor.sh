#!/bin/bash
#Plot the specific chromosome/contigs/scaffolds/segment 
# Demonstrate how actually works ./circosExtractor.sh

scriptbase=./scripts
#NOTE: Original circos.segdup.txt circos.sequences.txt and circos.highlight.txt should be in backup folder
backup=./backup
circosLoc=/home/urbe/Tools/circos-0.69-4/bin
echo Segment/chromosome/contigs you interstsed/like?
read val1

#All three main files should be in backup 
cp -rf $backup/*.txt .

grep -w $val1 circos.sequences.txt | awk '{print $3}' > seg.tmp
grep -F -w -f seg.tmp circos.segdup.txt > abc.tmp
perl $scriptbase/block_extractor1.pl abc.tmp circos.segdup.txt > abc2.tmp
perl $scriptbase/block_extractor2.pl abc2.tmp circos.sequences.txt > abc3.tmp
perl $scriptbase/block_extractor3.pl circos.segdup.txt circos.highlight.txt > abc4.tmp

mkdir backup
mv *.txt backup 

cp -rf abc2.tmp circos.segdup.txt
cp -rf abc3.tmp circos.sequences.txt
cp -rf abc4.tmp circos.highlight.txt

rm -rf *.tmp

#Circos command
$circosLoc/circos -conf circos.conf
