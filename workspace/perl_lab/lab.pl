#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $file = $ARGV[0];
my @lines;
my @header_lines;
my @keywords;
my $i;

open (my $fh, '<', $file)
  or die "Error: file $file not found.";

for($i = 0; $i < $#ARGV; ++$i){
  if($ARGV[$i + 1] =~ /[.]/){
    $keywords[$i] = "[.]";
  }
  else{
    $keywords[$i] = $ARGV[$i + 1];
  }
}

$i = 0;
my $j = 0;
while(my $line = <$fh>){
  if($line =~ /.*%.*/g){
    $lines[$i++] = $line;
  }
  elsif($j < 7){
    $header_lines[$j++] = $line;
  }
};

close $fh;

my @cols;
my @names;
my @usage;
$i = 0;

for($i = 0; $i < $#lines + 1; ++$i){
  @cols = split(/\s+/, $lines[$i]);
  $names[$i] = $cols[0];
  $usage[$i] = $cols[4];
  $usage[$i] =~ s/%//;
}

my @rows;

for($i = 0; $i < $#names + 1; ++$i){
  $rows[$i][0] = $usage[$i];
  $rows[$i][1] = $lines[$i];
}

my @sorted_rows = sort {$b->[0] <=> $a->[0]} @rows;

my @csv_rows;
my $matches = 0;

$i = 0;
for($i = 0; $i < $#sorted_rows + 1; ++$i){
  for($j = 0; $j < $#keywords + 1; ++$j){
    if($sorted_rows[$i][1] =~ /.*$keywords[$j].*/){
      $matches = 1;
    }
  }
  if(!$matches){
    $csv_rows[$i] = $sorted_rows[$i][1];
  }
  else{
    $csv_rows[$i] = "null";
    $matches = 0;
  }
}

$header_lines[0] =~ s/\s{2,}/,/g;
$header_lines[2] =~ s/\s{2,}/,/g;
$header_lines[3] =~ s/\s{2,}/,/g;
$header_lines[6] =~ s/\s{2,}/,/g;

$file = "disk_usage_report.csv";
open ($fh, '>', $file)
  or die "Error: file $file not found.";

print $fh "$header_lines[0]\n$header_lines[2]\n$header_lines[3]\n\n\n\n$header_lines[6]\n";

for my $s (@csv_rows){
  if($s !~ "null"){
    $s =~ s/\s+/,/g;
    print $fh "$s" . "\n";
  }
}

close $fh;

