#include <stdio.h>
int main(void){
    int dogs;
    _Bool bol;
    printf("how many dogs do you have? \n");
    scanf("%d", &dogs);
    printf("So you have %d dog(s)!\n", dogs);
    printf("size of int: %lu\n", sizeof(dogs));
    int* myp = &dogs;
    printf("size of int: %lu\n", sizeof(myp));  
    return 0;
}

