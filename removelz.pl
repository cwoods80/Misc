#!/usr/bin/perl

my $file='path to file'
my $file2='path to new file'

open( my $fh, '+<', $file);
(open my $fh2, '>', $file2);
while(my $row = <$fh>) {
  $row =~ s/^0+(?=[0-9])//;
  $row =~ s/^,/0./;
  print $fh2 $row;
  }
close $fh;
close $fh2;

rename $file2, $file
