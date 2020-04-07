#include<stdio.h>
#include<stdlib.h>

struct Node{
	int data;
	struct Node* next;
}Node;
struct Node* front=NULL;
struct Node* rear=NULL;

struct Node* createNode(int x){
	struct Node* newNode=(struct Node*)malloc(sizeof(struct Node));
	newNode->data=x;
	newNode->next=NULL;
	return newNode;
}

void enqueue(int n){
	struct Node* temp = createNode(n);
	if(front==NULL){
		rear=temp;
		front=temp;
		return;
	}
	else{
		rear->next=temp;
		rear=temp;
	}
}

int dequeue(){
	if(front==NULL){
		printf("Queue is empty.\n");
		return;
	}
	struct Node* temp=(struct Node*)malloc(sizeof(struct Node));
	temp=front;
	int n=temp->data;

	if(front==rear){
		front=rear=NULL;
	}
	else{
		front=temp->next;
	}
	free(temp);
	return n;
}

void printQueue(){
	if(front==NULL){
		printf("List is empty\n");
		return;
	}
	struct Node* temp=(struct Node*)malloc(sizeof(struct Node));
	temp=front;
	while(temp!=NULL){
		printf("%d %p\n", temp->data, temp->next);
		temp=temp->next;
	}
	printf("\n");
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