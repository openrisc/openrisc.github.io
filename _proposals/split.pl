#!/usr/bin/perl

use strict;

#---
#layout: page
#title: Proposal Template
#category: template
#date: 2016-10-17
#tagline: 
#---
#{% include JB/setup %}
#
### Description Of Change 1 (P1)
#Specify your change or addition to the specification.  Include diagrams
#instruction encodings as they would be represented in the final **pdf** 
#specification changes.
#
#Supporters, listed below, can be added as the revision proposals are
#discussed on the list.
#
# - Author - *Who you are* First Last <first.last@openrisc.io> 
# - Supporters - *Other members supporting these changes*


sub output_article {
  my ($title, $content) = @_;
 
  chomp $title;
 
  my $title_clean = $title;
  $title_clean =~ s/=//g;
  $title_clean =~ s/^ //g;
  $title_clean =~ s/ $//g;

  my $title_file = $title_clean;
  $title_file =~ s/P(\d+)//g;
  $title_file =~ s/[-*,.()]//g;
  $title_file =~ s/ $//g;
  $title_file =~ s/ $//g;
  $title_file =~ s/[ ]/-/g;
  $title_file = lc $title_file;

  print "$title_clean - $title_file\n";

  my $out;
  open $out, ">$title_file.md" or die $!;

  print $out "---\n";
  print $out "layout: page\n";
  print $out "title: $title_clean\n";
  print $out "category: draft\n";
  print $out "date: 2016-10-17\n";
  print $out "---\n";
  print $out "$content";
  print $out "\n";
  print $out " - Author - *who*\n";
  


  close $out;

}

my $in_article = 0;
my $title = "";
my $content = "";

while (<STDIN>) {
  if ($_ =~ /P(\d+)/ ) {
    if ($in_article) {
      output_article ($title, $content);
    }
    $in_article = 1;
    $title = $_;
    $content = "";
  } elsif ($in_article) {
    $content .= $_;
  }

}


