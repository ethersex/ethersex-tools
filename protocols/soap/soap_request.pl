#!/usr/bin/perl -w

use strict;
use SOAP::Lite;

my $soap = SOAP::Lite
    -> uri('http://ethersex.de/SOAP')
    -> proxy('http://192.168.22.130/soap');

my $whm = $soap->whm();
unless ($whm->fault) {
  print "Uptime of the device: ", $whm->result, "\n";
} else {
  print join ', ', $whm->faultcode, $whm->faultstring, $whm->faultdetail;
}
 
my $time = $soap->time();
unless ($time->fault) {
  print "System time of the device in seconds since 1.1.1970: ", $time->result, "\n";
} else {
  print join ', ', $whm->faultcode, $whm->faultstring, $whm->faultdetail;
}
