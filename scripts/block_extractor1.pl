#!/usr/bin/env perl

use strict;
use warnings;

my $blockListFile = $ARGV[0]; #file with the list of blocks to extract from the block file
my $blockfile = $ARGV[1]; # block file
my $block;
my $row;
my @row;
my %list;
my $fh;
my $line;
my @blockLine;


open($block, '<', $blockListFile) or die "Could not open file '$blockListFile' $!";
while ($row = <$block>) {
  chomp $row;
  @row = split / /, $row;
  $list{$row[0]} = 1;
  
}


foreach my $key (keys %list){
  open($fh, '<', $blockfile) or die "Could not open file '$blockfile' $!";
  while($line = <$fh>){
    @blockLine = split / /, $line;
    if ($key eq $blockLine[0]){
      print "$line";
    }

    }
}
