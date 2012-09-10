// #include <math.h>
#include <stdio.h>
#include <time.h>
#include <cmath>
#include <iostream>

//функция, аналогичная тому что мы делали на js
float func(float x, float y){
    return sin(x*y)/(1+sqrt(x*x+y*y))+2;
}

void funcCPU(float x0, float xn, float y0, float yn, int iterations){
    double x,y,value,result;
	clock_t t1, t2;
	time_t z1, z2;
    result=0;
	t1 = clock();
	z1 = time(NULL);
    for (int i = 0; i < iterations; i++){
        for (int j = 0; j < iterations; j++){
            x = x0 + (xn - x0) / iterations * i;
            y = y0 + (yn - y0) / iterations * j;
            value = func(x, y);
            result+=value*(xn-x0)*(yn-y0)/(iterations*iterations);
        }
    }
    //char *c = new char[20];
	t2 = clock();
	z2 = time(NULL);
    printf("C result = %f\n",result);
	printf("C time = %f\n(%f; %f)\n", ((float)t2 - (float)t1)/1000, (float)t1, (float)t2);
	printf("%ld; %ld\n", z1, z2);
	return;
    //return c;
}

int main(){
	funcCPU(-4,4,-4,4,1024);
	return 0;
}