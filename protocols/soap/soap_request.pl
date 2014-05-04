#!/usr/bin/perl -w

use strict;
use SOAP::Lite;

my $soap = SOAP::Lite
    -> uri('http://ethersex.de/SOAP')
    -> proxy('http://192.168.22.130/soap');

my $whm = $soap->whm();

print "Uptime of the device: ", $whm, "\n";
 
my $time = $soap->time();

print "System time of the device in seconds since 1.1.1970: ", $time, "\n";
