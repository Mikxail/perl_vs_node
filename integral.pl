#!/usr/bin/perl

use strict;
use warnings;
use Time::HiRes qw (time);

sub func {
	my ($x, $y) = @_;
    return sin($x*$y)/(1+sqrt($x*$x+$y*$y))+2;
}
sub integratePerl{
	my ($x0,$xN,$y0,$yN,$iterations) = @_;
    my $result=0;
    my $_time = time();
    for (my $i = 0; $i < $iterations; $i++){
        for (my $j = 0; $j < $iterations; $j++){
            #вычисление координат текущего прямоугольника
            my $x = $x0 + ($xN - $x0) / $iterations * $i;
            my $y = $y0 + ($yN - $y0) / $iterations * $j;
            my $value = func($x, $y); #вычисление значения функции
            #вычисление объема параллелепипеда и прибавка к общему объему
            $result+=$value*($xN-$x0)*($yN-$y0)/($iterations*$iterations); 
        }
    }
    print("Perl result = ".$result);
    print("\nPerl time = ".((time() - $_time)*1000) );
	print "\n";
}

integratePerl(-4,4,-4,4,1024);