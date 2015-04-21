#!/usr/bin/perl -w
while(<>) {
    ($var = $_ ) =~ s/^\s+|\s+$//g;
    print( "for( var i=0, n=$var.length; i<n; i++ ) {" );
}
