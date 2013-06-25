#!/usr/bin/env perl
use strict;
use Net::Telnet ();

my $esexip=$ARGV[0];
my $esexport="2701";
my $esex;
my @sensor;
my $sensor;
my $dummy;
my $temp;

$esex = Net::Telnet->new || die "kann Ethersex nicht finden";;
$esex->open(Host  => $esexip,
            Port    => $esexport,
            Timeout => 2);
#Get all Sensor IDs
$esex->print("1w list");
($sensor) = $esex->waitfor(Timeout => 2,
String  => "OK");
@sensor=split(/\s+/, $sensor);
print "@sensor","\n"; #Kontrollausgabe

my $counter=@sensor;
print "Sensor Count:",$counter,"\n\n";

#Convert all sensors
$esex->print("1w convert");
$esex->waitfor(Timeout => 2,
String  => "OK");

#Get temperature for each sensor
foreach (@sensor) {
  $esex->print("1w get $_");

  ($dummy,$temp)=$esex->waitfor(Match   =>'/[-]?\d+\.\d+/',
  Timeout => 5);

  print "Temperature of ID ",$_,": ",$temp," C°","\n";
}
