#!/usr/bin/perl -w
while(<>) {
    ($var = $_ ) =~ s/^\s+|\s+$//g;
    print( "for( var i=$var.length; --i; ) {" );
}
