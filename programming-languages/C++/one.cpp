#include<iostream>
using namespace std;    //use the standard libraries

int main(){
    int a;
    int b;
    int sum;

    cout<< "BASIC I/O \n";

    cout<< "Enter two numbers\n";
    cin>>a; cin>>b;	//THERE ALREADY IS A \n BEFORE CIN.
    cout<< a << "\n";   //PRINTING A VARIABLE
    sum=a+b;
    cout<< "sum = " << sum << "\n\n\n";

    if(a>b){
        cout<< "a is greater\n\n\n";
    }
    else
        cout<< "b is greater\n\n\n";

    //EXCEPTIONS
    try{
        int x=10, y=0, z=0;
        z=x/y;
        if(y==0)
            throw "abc";
        cout<< z <<endl;
    }catch(char* ae){
        cout<< "Division by 0 not possible\n";
        return 1;
    }

    return 0;
}
