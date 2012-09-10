#!/usr/bin/perl


use strict;
use PDL;
use Time::HiRes qw (time);
#use Benchmark qw(:all :hireswallclock);

#timethis(1, sub { print integrate(-4,4,-4,4,1024)."\n" });

my $_time = time();
my $result = integrate(-4,4,-4,4,1024);
print("Perl result = ".$result);
print("\nPerl time = ".((time() - $_time)*1000) );
print "\n";

sub integrate {
    my ($x0,$x1,$y0,$y1,$steps) = @_;
    my $d = zeroes(float, $steps, $steps);
    my ($x, $y) = ( $d->xlinvals($x0, $x1), $d->ylinvals($y0, $y1) );
    sum(sin($x * $y) / (1 + sqrt($x**2 + $y**2)) + 2) * ($x1-$x0) * ($y1-$y0) / $steps**2;
}