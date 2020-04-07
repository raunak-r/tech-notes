#include<stdio.h> //

int/void main() /*OR*/ int main(void) /*OR*/ void main(void or int)  // int is used when int value is returned, void when nothing.
{
    int a,b;        //Data Types
    char b,c;
    double d;
    float e;

    printf("Hello"); //To print a line
    printf("\n");    //To print a new line

    scanf("%d %f %c", &int, &float, &char);   //Input int float or char.
    //%lf = double
    //%x.yf = x is total digits in all. y is digits to the right of decimal.

    int arr[]={1,2,3, /*and so on*/}        //Array
    int arr[3];      //when array is predefined

    char str[]={'r','a','u','n','a','k',0};   //String is predefined.
    char str[17]="Computer Program ";         //16 char + 1 for null character.
    scanf("%s", str);                         //Input String
    scanf("%[^\n]s", str);                    //Input String with spaces.

    gets(str);                                //input String with spaces.
    puts(str);                                //Output String.

    strcpy(s1,s2);                            //Copy s2 in s1.
    strcat(s1,s2);                            //Add String s2 to s1. Size of s1 should be large enough.
    strlen(s1,s2);                            //Computes the length of s1.
    strcmp(s1,s2);                            //Compares s1 and s2 and returns 0 if s1=s2. +ve int if s1>s2. -ve int if s1<s2. based on which string will come first in a dictionary.




    //While Loop
    while(Test loop counter){
        do this;
        and this;
        increment loop counter;
    }

    //Do while Loop
    do{
        this;
        and this;

    }while(this condition is true);

                    //Break statement - takes the execution control out of the loop.
                    //Continue Statement - skips the exec. after it and takes the control to the beginning of the loop.

    if(){}
    else if(){}
                    //these end with else if only.

    calsum(x, y, z)     //Defining functions, but the function should be defined once again before the start of main function.
    //OR
    calsum(int x, int y, int z)
    //OR
    void function(char str[])
    //OR

    main(){ float function(float)}      //Calling functions
    float function(float a){}



}
