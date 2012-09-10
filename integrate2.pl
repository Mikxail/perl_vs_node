#!perl -w
use strict;
use Time::HiRes 'time';

sub integratePerl {
    my ($x0,$xN,$y0,$yN,$iterations) = @_;
    my $result=0;
    my $_time = time();
    my ($i, $j, $x, $y);
    for ($i = 0; $i < $iterations; $i++){
        for ($j = 0; $j < $iterations; $j++){
            $x = $x0 + ($xN - $x0) / $iterations * $i;
            $y = $y0 + ($yN - $y0) / $iterations * $j;
            $result+=sin($x*$y)/(1+sqrt($x*$x+$y*$y))+2; 
        }
    }
    print("Perl result = ".$result*($xN-$x0)*($yN-$y0)/($iterations*$iterations));
    print("\nPerl time = ".((time() - $_time)*1000) );
	print "\n";
}

integratePerl(-4,4,-4,4,1024);
