#!/usr/bin/perl -w

use strict;
use SOAP::Lite;

my $soap = SOAP::Lite
    -> uri('http://ethersex.de/SOAP')
    -> proxy('http://192.168.22.130/soap');

my $whm = $soap->whm();

print "Aktuelle Uptime des Ethersex: ", $whm, "\n";
 
my $time = $soap->time();

print "Aktuelle Systemzeit (Unix-Timestamp): ", $time, "\n";
