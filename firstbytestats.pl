#!/usr/bin/perl

use CGI ':standard'; 
use CGI::Carp qw(fatalsToBrowser);

print "Content-Type:text/plain\n";  
print "Content-Disposition:attachment;filename=firstbytestats.pl\n\n"; 

open FILE, "< /var/www/matthewlloyd.net/cgi-bin/servetime.pl";
while (<FILE>) { 
    if (/deleteline/) { next; }
    print; 
}
close FILE;
