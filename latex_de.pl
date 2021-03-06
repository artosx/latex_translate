#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV<0) { die "No filename given" };

my $filename = $ARGV[0];
open(IFH, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

binmode(STDOUT, ":utf8");
while (<IFH>) {
  #google hacks
  $_ =~ s/\ __\ /__/g;
  $_ =~ s/__\ /__/g;

  $_ =~ s/__xx(.+?)xx__/\\qverb\|$1\|/g;
  $_ =~ s/__vv(.+?)vv__/\\cverb\|$1\|/g;
  $_ =~ s/__zz(.+?)zz__/\\begin\{$1\}/g;
  $_ =~ s/__yy(.+?)yy__/\\end\{$1\}/g;
  $_ =~ s/__cc__/\\\\/g;
  $_ =~ s/__aa/\\/g;
  $_ =~ s/bb__/\{/g;
  $_ =~ s/__bb/\}/g; 
  $_ =~ s/__dd/\*/g;
  $_ =~ s/__ee/\-\-/g;
  $_ =~ s/__ff/\,/g;

  $_ =~ s/\$\ /\$/g;
  $_ =~ s/\ \$/\$/g;
  $_ =~ s/\ _/_/g;
  $_ =~ s/\ \/\ /\//g;
  $_ =~ s/\:\ /\:/g;
  print;
}

close IFH;