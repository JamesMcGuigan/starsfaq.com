#!/usr/bin/perl
while(<>) {
    ($line  = $_   ) =~ s/^\s+|\s+$//g;
    ($quote = $line) =~ s/'/\\'/g;
    $line =~ s/^(\s+|}|if|else|var|fo[r]|return)+\(?//g;  # strip if/else, var, return, for starts
    $line =~ s/^\s*[\w\.]+\s*[:=]\s*function\s*\(//g;     # strip function declaration starts
    $line =~ s/^\s*function +\w+\s*\(//g;                 # strip function declaration starts
    $line =~ s/,?\s*\)\s*\{$//g;                          # strip function declaration ends
    $line =~ s/^\s*$//;                                   # don't allow an empty string
    $line =~ s/[,;\s]*$//g;                               # strip trailing semicolons, commas, spaces
 
    $line =~ s/(\$\([^)]*),/$1¬/g;                             # sub out jquery commas before split
    if( $line =~ /,|\|\||&&|;/ ) {
        $line = join '', map { "' $_: ', $_, "  } split /\s*[,;|&]+\s*/, $line;
        $quote =~ s/\S+,.*$//; # strip after first comma term
    }
    $line =~ s/(\$\([^)]*)¬/$1,/;                         # replace jquery commas before split
    $line =~ s/[,;\s]*$//g;                               # strip trailing semicolons, commas, spaces
    $line = "''" unless $line;
    print "console.log('DEBUG: ', this&&this.klass||'' ,' $quote ', $line);\n";
}
