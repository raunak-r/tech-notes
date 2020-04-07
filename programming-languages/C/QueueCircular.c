#include<stdio.h>
#include<stdlib.h>
#define N 5
int arr[N];
int rear=-1;
int front=-1;

void enqueue(int x){
	if(isFull()){
		printf("Queue is full.\n");
		return;
	}
	else if(isEmpty()){
		front++;
		rear++;
	}
	else{
		rear=(rear+1)%N;		//CHANGE
	}
	arr[rear]=x;
}

int dequeue(){
	if(isEmpty()){
		printf("Queue is Empty.\n");
		return;
	}
	else if(front==rear){
		int x=arr[rear];
		rear=-1;
		front=-1;
		return arr[rear];
	}
	else{
		int x=arr[front];;
		front=(front+1)%N;		//CHANGE
		return x;
	}
}

int isEmpty(){
	if(rear==-1 && front==-1)
		return 1;
	else
		return 0;
}

int isFull(){
	if((rear+1)%N==front)		//CHANGE
		return 1;
	else
		return 0;
}

void printQueue(){
	if(isEmpty()){
		printf("Queue is Empty.\n");
		return;
	}
/*	printf("\n");
	int i;
	for(i=front;i<=rear;){
		printf("%d ", arr[i]);
		i++;
	}*/
	printf("\n\n");
}

int main(){
	int flag=1;
	while(flag!=0){
		printf("1. Enqueue elem.\n");
		printf("2. Dequeue elem.\n");
		printf("3. Print Queue.\n");
		printf("0. Exit\n");

		scanf("%d", &flag);
		if(flag==1){
			int n;
			scanf("%d", &n);
			enqueue(n);
			printQueue();
		}

		if(flag==2){
			printf("%d\n", dequeue());
			printQueue();
		}
		if(flag==3){
			printQueue();
		}
		if(flag==4){
			return 0;
		}
	}
}