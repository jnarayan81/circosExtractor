#!/usr/bin/env perl
use strict;
use warnings;

my %myHash;

open(my $fh, '<', $ARGV[0]) or die "Could not open file '$ARGV[0]' $!";
while (<$fh>) {
  chomp;
  $myHash{$_}=$.;
}


open(my $block, '<', $ARGV[1]) or die "Could not open file '$ARGV[1]' $!";
while (my $row = <$block>) {
  chomp $row;
  my @row = split / /, $row;
  print "$row\n" if !exists $myHash{$row[0]};
}

