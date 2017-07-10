#!/usr/bin/env perl

use strict;
use warnings;

my $syntenyFile = $ARGV[0];
my $id = $ARGV[1];
my $line;
my $fh;
my @mem;
my $next;

open($fh, '<', $syntenyFile) or die "Could not open file '$syntenyFile' $!";

while ($line = <$fh>) {
  chomp $line;
  next if $line =~ /^\-+/;
  if ($line =~ /^$id/){
    print "$_\n" for @mem;
    @mem = ();
    print "$line\n";
    while (my $next = <$fh>){
      if ($next =~ /^Block/){
        last;
      }
      else{
        print $next;
      }
    }
  }
  else {
    push @mem, $line;
    if ($line =~ /^Block/){
      @mem = ();
    }
  }
  # body...
}
close $fh;
