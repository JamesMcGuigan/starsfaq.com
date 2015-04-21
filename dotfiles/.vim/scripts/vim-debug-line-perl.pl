#!/usr/bin/perl
while(<>) {
    ($line  = $_   ) =~ s/^\s+|\s+$//g;
    $line =~ s/(if|else|elsif|else *if)+ *\( *(.*?) *\) */$2/;
    ($quote = $line) =~ s/'/\\'/g;
    $line =~ s/;$//g;                       # strip trailing semicolons
    $line =~ s/,?\s*\)\s*\{$//g;            # strip function declaration ends
    $line =~ s/^\s*$//;                     # don't allow an empty string
    $line =~ s/^\[@%]/\\\1/;                # pass array or hash by reference
    print "use Data::Dumper; warn 'DEBUG: $quote: ' . Dumper \\$line;\n"
}
