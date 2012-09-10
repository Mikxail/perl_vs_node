var func = function(x,y){
    return Math.sin(x*y)/(1+Math.sqrt(x*x+y*y))+2;
}
function integrateJS(x0,xN,y0,yN,iterations){
    var result=0;
    var time = new Date().getTime();
    for (var i = 0; i < iterations; i++){
        for (var j = 0; j < iterations; j++){
            //вычисление координат текущего прямоугольника
            var x = x0 + (xN - x0) / iterations * i; 
            var y = y0 + (yN - y0) / iterations * j;
            var value = func(x, y); //вычисление значения функции
            //вычисление объема параллелепипеда и прибавка к общему объему
            result+=value*(xN-x0)*(yN-y0)/(iterations*iterations); 
        }
    }
    console.log("JS result = "+result);
    console.log("JS time = "+(new Date().getTime() - time));
}

integrateJS(-4,4,-4,4,1024);