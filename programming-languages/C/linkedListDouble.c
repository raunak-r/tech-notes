#include<stdio.h>
#include<stdlib.h>

struct Node{
	int data;
	struct Node* prev;
	struct Node* next;
};
struct Node* head=NULL;

struct Node* createNode(int x){
	struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
	newNode->data=x;
	newNode->next=newNode->prev=NULL;
	return newNode;
}

void insertFirst(int x){
	struct Node* temp = createNode(x);

	if(head==NULL){
		head=temp;
	}
	else{
		struct Node* firstNode = (struct Node*)malloc(sizeof(struct Node));
		firstNode = head;
		temp->next=head;
		firstNode->prev=temp;
		head=temp;
	}

}

void insertLast(int x){
	struct Node* temp = createNode(x);

	if(head==NULL){
		head=temp;
	}
	else{
	struct Node* current = (struct Node*)malloc(sizeof(struct Node));
		current=head;
		while(current->next!=NULL){
			current=current->next;
		}
		temp->prev=current;
		current->next=temp;
	}
}

void printNodes(){
	struct Node* current = (struct Node*)malloc(sizeof(struct Node));
	current=head;
	while(current!=NULL){
		printf("%p---%d---%p\n", current->prev, current->data, current->next);
		current=current->next;
	}
	printf("\n\n");
}

int main(){
	printf("This is a program to perform 6 functions\n");
	int a=0, flag=1, pos=0;

	while(flag!=0){
		printf("1. Insert at Beginning.\n");
		printf("2. Insert at End.\n");
		//printf("3. Insert at Position.\n");
		//printf("4. Delete at Beginning.\n");
		//printf("5. Delete at End.\n");
		printf("6. Print the List\n");
		printf("0. Exit\n");

		scanf("%d", &flag);

		if(flag==1){
			scanf("%d", &a);
			insertFirst(a);
			printNodes();
			printf("\n");
		}

		if(flag==2){
			scanf("%d", &a);
			insertLast(a);
			printNodes();
			printf("\n");
		}
		
		/*if(flag==3){
			printf("Enter number and position");
			scanf("%d %d", &a, &pos);
			insertAt(a, pos);
			printNodes();
			printf("\n");
		}

		if(flag==4){
			deleteBeg();
			printNodes();
		}
		
		if(flag==5){
			deleteEnd();
			printNodes();
		}
*/
		if(flag==6){
			printNodes();
		}

		if(flag==0){
			return 0;
		}
	}
}