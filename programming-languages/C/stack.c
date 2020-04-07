#include<stdio.h>
#define MAXSIZE 101
int a[MAXSIZE];	//the stack is an array, of size MAXSIZE.
int top = -1;	//init value is -1. The stacks will start from 0 to MAXSIZE-1.

void Push(int x)
{
    if (top == MAXSIZE-1){	//at the topmost shelf.
        printf("Error: Stack Overflow \n");
        return;
    }
    top=top+1;	//each time PUSH is called, top goes above by 1.
    a[top]=x;
}

void Pop()
{
    if(top == -1){
        printf("Error: Stack is Empty");
        return;
    }
    else
        top = top-1;	//each time POP is called, top comes down by 1.
}

int Top()
{
    return a[top];
}

void Print()
{
    int i;
    printf("Stack: ");
    for(i=0; i<=top; i++){
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main()
{
    Print();
    Push(2); Print();
    Push(5); Print();
    Push(10); Print();
    Pop(); Print();
    Pop(); Print();
    Pop(); Print();
    Pop(); Print();
}
