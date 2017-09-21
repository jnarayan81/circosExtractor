#!/usr/bin/env perl
use strict;
use warnings;

open(my $block, '<', $ARGV[0]) or die "Could not open file '$ARGV[0]' $!";
while (my $row = <$block>) {
  chomp $row;
  my @row = split / /, $row;
  if ($ARGV[1] eq $row[1]) {
  print "$row[0]\n";
  }
}

