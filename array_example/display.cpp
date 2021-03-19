#include <iostream> 

extern "C" void display_array(double array[], long index);

void display_array(double array[], long index){
    for (long i =0; i < index; i++){
        printf("%lf", array[i]);
        printf("%s", " ");
    }
    printf("\n\n");
}