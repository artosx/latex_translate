#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV<0) { die "No filename given" };

my $filename = $ARGV[0];
open(IFH, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

binmode(STDOUT, ":utf8");

while (<IFH>) {
  $_ =~ s/\\begin\{([^\}]+)\}/__zz$1zz__/g;
  $_ =~ s/\\end\{([^\}]+)\}/__yy$1yy__/g;
  $_ =~ s/\\qverb\|([^\|]+)\|/__xx$1xx__/g;
  $_ =~ s/\\cverb\|([^\|]+)\|/__vv$1vv__/g;
  $_ =~ s/\\/__aa/g;
  $_ =~ s/\{/__bb/g;
  $_ =~ s/\}/bb__/g;
  print;
}

close IFH;