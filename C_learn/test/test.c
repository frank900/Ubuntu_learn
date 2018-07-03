#include <stdio.h>
#include <stdint.h>
int main(void){
    int dogs;
    int32_t myi;
    double bol;
    printf("how many dogs do you have? \n");
    scanf("%d", &dogs);
    printf("So you have %d dog(s)!\n", dogs);
    printf("size of int: %lu\n", sizeof(dogs));
    int* myp = &dogs;
    printf("size of int: %lu\n", sizeof(myp));  
    printf("size of int_32: %lu\n", sizeof(bol));  
    return 0;

}

