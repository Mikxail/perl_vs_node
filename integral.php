<?
function func ($x,$y){
    return sin($x*$y)/(1+sqrt($x*$x+$y*$y))+2;
}
function integratePHP($x0,$xN,$y0,$yN,$iterations){
    $result=0;
    $time = microtime(true);
    for ($i = 0; $i < $iterations; $i++){
        for ($j = 0; $j < $iterations; $j++){
            //вычисление координат текущего прямоугольника
            $x = $x0 + ($xN - $x0) / $iterations * $i; 
            $y = $y0 + ($yN - $y0) / $iterations * $j;
            $value = func($x, $y); //вычисление значения функции
            //вычисление объема параллелепипеда и прибавка к общему объему
            $result+=$value*($xN-$x0)*($yN-$y0)/($iterations*$iterations); 
        }
    }
    echo ("PHP result = ".$result);
    echo ("\nPHP time = ".((microtime(true) - $time)*1000));
	echo "\n";
}

integratePHP(-4,4,-4,4,1024);

?>